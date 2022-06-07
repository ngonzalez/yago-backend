require "rails_helper"

RSpec.describe Mutations::CreateQuote do
  context "Mutations" do
    let(:company) { FactoryBot.create(:company) }
    it "Create a quote" do
      variables = {
        companyId: company.id,
        available: true,
        coverageCeiling: Faker::Number.between(from: 5_000, to: 10_000),
        deductible: Faker::Number.between(from: 5_000, to: 10_000),
        quoteId: "seniorTechChallenge#{rand(100000)}",
        grossPremiums: "{\"afterDelivery\":43.2,\"publicLiability\":162,\"professionalIndemnity\":194.4,\"entrustedObjects\":54,\"legalExpenses\":64.8}",
      }

      query = GraphQL::Query.new(
        YagoBackendSchema,
        mutation,
        variables: variables.deep_stringify_keys,
        context: {},
      )

      result = query.result

      expect(result.dig("data", "createQuote", "quote", "available")).to eq(variables[:available])
      expect(result.dig("data", "createQuote", "quote", "coverageCeiling")).to eq(variables[:coverageCeiling])
      expect(result.dig("data", "createQuote", "quote", "deductible")).to eq(variables[:deductible])
      expect(result.dig("data", "createQuote", "quote", "quoteId")).to eq(variables[:quoteId])
      expect(result.dig("data", "createQuote", "quote", "grossPremiums")).to eq(variables[:grossPremiums])
    end
  end

  def mutation
    <<~GQL
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
    GQL
  end
end
