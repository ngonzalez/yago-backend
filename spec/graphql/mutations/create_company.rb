require "rails_helper"

RSpec.describe Mutations::CreateCompany do
  context "Mutations" do
    it "Create a company" do
      variables = {
        annualRevenue: Faker::Number.between(from: 5_000, to: 10_000),
        enterpriseNumber: Faker::Number.leading_zero_number(digits: 10),
        legalName: Faker::Company.name,
        naturalPerson: true,
        naceBelCodes: "[\"05200\"]"
      }

      query = GraphQL::Query.new(
        YagoBackendSchema,
        mutation,
        variables: variables.deep_stringify_keys,
        context: {},
      )

      result = query.result

      expect(result.dig("data", "createCompany", "company", "annualRevenue")).to eq(variables[:annualRevenue].to_s)
      expect(result.dig("data", "createCompany", "company", "enterpriseNumber")).to eq(variables[:enterpriseNumber])
      expect(result.dig("data", "createCompany", "company", "legalName")).to eq(variables[:legalName])
      expect(result.dig("data", "createCompany", "company", "naturalPerson")).to eq(variables[:naturalPerson])
      expect(result.dig("data", "createCompany", "company", "naceBelCodes")).to eq(variables[:naceBelCodes])
    end
  end

  def mutation
    <<~GQL
    mutation createCompany(
      $annualRevenue: Int!,
      $enterpriseNumber: String!,
      $legalName: String!,
      $naturalPerson: Boolean!,
      $naceBelCodes: JSON!,
    ) {
      createCompany(input: {
        annualRevenue: $annualRevenue,
        enterpriseNumber: $enterpriseNumber,
        legalName: $legalName,
        naturalPerson: $naturalPerson,
        naceBelCodes: $naceBelCodes,
      }) {
        company {
          id
          itemId
          annualRevenue
          enterpriseNumber
          legalName
          naturalPerson
          naceBelCodes
        }
        success
        errors
      }
    }
    GQL
  end
end
