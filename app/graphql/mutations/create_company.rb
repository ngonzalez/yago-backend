module Mutations
  class CreateCompany < Mutations::BaseMutation
    graphql_name "CreateCompany"

    argument :annual_revenue, Integer, required: true
    argument :enterprise_number, String, required: true
    argument :legal_name, String, required: true
    argument :natural_person, Boolean, required: true
    argument :nace_bel_codes, GraphQL::Types::JSON, required: true

    field :company, Types::Company, null: false

    def resolve(args)
      company = Company.create!(
        annual_revenue: args[:annual_revenue],
        enterprise_number: args[:enterprise_number],
        legal_name: args[:legal_name],
        natural_person: args[:natural_person],
        nace_bel_codes: args[:nace_bel_codes],
      )

      MutationResult.call(
        obj: { company: company },
        success: company.persisted?,
        errors: [],
      )
    end
  end
end
