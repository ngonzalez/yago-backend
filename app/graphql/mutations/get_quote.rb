module Mutations
  class GetQuote < Mutations::BaseMutation
    graphql_name "GetQuote"

    argument :quote_id, String, required: true

    field :quote, Types::Quote, null: false

    def resolve(args)
      quote = Quote.find_by(quote_id: args[:quote_id])

      MutationResult.call(
        obj: { quote: quote },
        success: true,
        errors: [],
      )
    end
  end
end
