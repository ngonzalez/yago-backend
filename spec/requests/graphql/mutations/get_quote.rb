require "rails_helper"

RSpec.describe "Get quote" do
  subject(:request) {
    post "/graphql", headers: { 'Content-Type' => 'application/json' }, params: { query: query, variables: variables }.to_json
  }
  let(:company) { create(:company) }
  let(:quote) { create(:quote, company: company) }
  let(:query) do
    <<~GRAPHQL
    mutation getQuote(
      $quoteId: String!,
    ) {
      getQuote(input: {
        quoteId: $quoteId,
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
      quoteId: quote.quote_id,
    }
  end
  let(:expected_result) do
    {
      data: {
        getQuote: {
          quote: {
            available: quote.available,
            coverageCeiling: quote.coverage_ceiling,
            deductible: quote.deductible,
            quoteId: quote.quote_id,
            grossPremiums: quote.gross_premiums,
          },
          success: true,
          errors: [],
        },
      }
    }
  end

  it "returns a 200 HTTP code" do
    request
    expect(response).to have_http_status :ok
  end

  it "returns company details" do
    request
    expect(JSON.parse(response.body).deep_symbolize_keys).to include_json expected_result
  end
end
