require "rails_helper"

RSpec.describe "Creates a quote" do
  subject(:request) {
    post "/graphql", headers: { 'Content-Type' => 'application/json' }, params: { query: query, variables: variables }.to_json
  }
  let(:company) { create(:company) }
  let(:query) do
    <<~GRAPHQL
    mutation createQuote(
      $companyId: Int!,
      $available: Boolean!,
      $coverageCeiling: Int!,
      $deductible: Int!,
      $quoteId: String!,
      $grossPremiums: JSON!,
    ) {
      createQuote(input: {
        companyId: $companyId
        available: $available
        coverageCeiling: $coverageCeiling
        deductible: $deductible
        quoteId: $quoteId
        grossPremiums: $grossPremiums
      }) {
        quote {
          id
          available
          coverageCeiling
          deductible
          quoteId
          grossPremiums
        }
        success
        errors
      }
    }
    GRAPHQL
  end
  let(:variables) do
    {
      companyId: company.id,
      available: true,
      coverageCeiling: Faker::Number.between(from: 5_000, to: 10_000),
      deductible: Faker::Number.between(from: 5_000, to: 10_000),
      quoteId: "seniorTechChallenge#{rand(100000)}",
      grossPremiums: "{\"afterDelivery\":43.2,\"publicLiability\":162,\"professionalIndemnity\":194.4,\"entrustedObjects\":54,\"legalExpenses\":64.8}",
    }
  end
  let(:expected_result) do
    {
      data: {
        createQuote: {
          quote: {
            available: variables[:available],
            coverageCeiling: variables[:coverageCeiling],
            deductible: variables[:deductible],
            quoteId: variables[:quoteId],
            grossPremiums: variables[:grossPremiums],
          },
          success: true,
          errors: [],
        }
      }
    }
  end

  it "returns a 200 HTTP code" do
    request
    expect(response).to have_http_status :ok
  end

  it "returns quote details" do
    request
    expect(JSON.parse(response.body).deep_symbolize_keys).to include_json expected_result
  end
end
