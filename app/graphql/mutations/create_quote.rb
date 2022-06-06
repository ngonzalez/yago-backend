module Mutations
  class CreateQuote < Mutations::BaseMutation
    graphql_name "CreateQuote"

    def resolve(args)
      quote = Quote.new

      MutationResult.call(
        obj: { quote: quote },
        success: quote.persisted?,
        errors: [],
      )
    end
  end
end
