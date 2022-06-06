module Mutations
  class CreateQuote < Mutations::BaseMutation
    graphql_name "CreateQuote"

    argument :company_id, Integer, required: true
    argument :available, Boolean, required: true
    argument :coverage_ceiling, Integer, required: true
    argument :deductible, Integer, required: true
    argument :quote_id, String, required: true
    argument :gross_premiums, GraphQL::Types::JSON, required: true

    field :quote, Types::Quote, null: false

    def resolve(args)
      company = Company.find(args[:company_id])

      quote = company.quotes.create!(
        available: args[:available],
        coverage_ceiling: args[:coverage_ceiling],
        deductible: args[:deductible],
        remote_quote_id: args[:quote_id],
        gross_premiums: args[:gross_premiums],
      )

      MutationResult.call(
        obj: { quote: quote },
        success: quote.persisted?,
        errors: [],
      )
    end
  end
end
