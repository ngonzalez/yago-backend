module Mutations
  class GetNaceBelCodes < Mutations::BaseMutation
    graphql_name "GetNaceBelCodes"

    argument :level, Integer, required: true

    field :nace_bel_codes, [Types::NaceBelCode], null: false

    def resolve(args)
      nace_bel_codes = NaceBelCode.where(level: args[:level]).all

      MutationResult.call(
        obj: { nace_bel_codes: nace_bel_codes },
        success: true,
        errors: [],
      )
    end
  end
end
