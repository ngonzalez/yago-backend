module Mutations
  class GetCompany < Mutations::BaseMutation
    graphql_name "GetCompany"

    argument :company_id, Integer, required: true

    field :company, Types::Company, null: false

    def resolve(args)
      company = Company.find args[:company_id]

      MutationResult.call(
        obj: { company: company },
        success: true,
        errors: [],
      )
    end
  end
end
