require "rails_helper"

RSpec.describe Mutations::GetCompany do
  context "Mutations" do
    let(:company) { FactoryBot.create(:company) }
    it "Get company" do
      variables = {
        companyId: company.id,
      }

      query = GraphQL::Query.new(
        YagoBackendSchema,
        mutation,
        variables: variables.deep_stringify_keys,
        context: {},
      )

      result = query.result

      expect(result.dig("data", "getCompany", "company", "itemId")).to eq(company.id)
      expect(result.dig("data", "getCompany", "company", "annualRevenue")).to eq(company.annual_revenue.to_s)
      expect(result.dig("data", "getCompany", "company", "enterpriseNumber")).to eq(company.enterprise_number)
      expect(result.dig("data", "getCompany", "company", "legalName")).to eq(company.legal_name)
      expect(result.dig("data", "getCompany", "company", "naturalPerson")).to eq(company.natural_person)
      expect(result.dig("data", "getCompany", "company", "naceBelCodes")).to eq(company.nace_bel_codes)
    end
  end

  def mutation
    <<~GQL
    mutation getCompany(
      $companyId: Int!,
    ) {
      getCompany(input: {
        companyId: $companyId,
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
