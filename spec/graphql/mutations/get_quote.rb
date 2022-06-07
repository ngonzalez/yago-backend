require "rails_helper"

RSpec.describe Mutations::GetQuote do
  context "Mutations" do
    let(:company) { FactoryBot.create(:company) }
    let(:quote) { FactoryBot.create(:quote, company: company) }
    it "Get quote" do
      variables = {
        quoteId: quote.quote_id
      }

      query = GraphQL::Query.new(
        YagoBackendSchema,
        mutation,
        variables: variables.deep_stringify_keys,
        context: {},
      )

      result = query.result

      expect(result.dig("data", "getQuote", "quote", "available")).to eq(quote.available)
      expect(result.dig("data", "getQuote", "quote", "coverageCeiling")).to eq(quote.coverage_ceiling)
      expect(result.dig("data", "getQuote", "quote", "deductible")).to eq(quote.deductible)
      expect(result.dig("data", "getQuote", "quote", "quoteId")).to eq(quote.quote_id)
      expect(result.dig("data", "getQuote", "quote", "grossPremiums")).to eq(quote.gross_premiums)
      expect(result.dig("data", "getQuote", "success")).to eq(true)
      expect(result.dig("data", "getQuote", "errors")).to eq([])
    end
  end

  def mutation
    <<~GQL
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
    GQL
  end
end
