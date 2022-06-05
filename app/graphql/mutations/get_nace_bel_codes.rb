module Mutations
  class GetNaceBelCodes < Mutations::BaseMutation
    graphql_name "GetNaceBelCodes"

    argument :level, Integer, required: true
    argument :parent_code, String, required: true

    field :nace_bel_codes, [Types::NaceBelCode], null: false

    def resolve(args)
      if args[:parent_code].blank?
        nace_bel_codes = NaceBelCode.where(level: args[:level]).all
      else
        nace_bel_codes = NaceBelCode.where(level: args[:level], parent_code: args[:parent_code]).all
      end

      MutationResult.call(
        obj: { nace_bel_codes: nace_bel_codes },
        success: true,
        errors: [],
      )
    end
  end
end
