require "rails_helper"

RSpec.describe "Get company" do
  subject(:request) {
    post "/graphql", headers: { 'Content-Type' => 'application/json' }, params: { query: query, variables: variables }.to_json
  }
  let(:company) { FactoryBot.create(:company) }
  let(:query) do
    <<~GRAPHQL
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
    GRAPHQL
  end
  let(:variables) do
    {
      companyId: company.id,
    }
  end
  let(:expected_result) do
    {
      data: {
        getCompany: {
          company: {
            annualRevenue: company.annual_revenue.to_s,
            enterpriseNumber: company.enterprise_number,
            legalName: company.legal_name,
            naturalPerson: company.natural_person,
            naceBelCodes: company.nace_bel_codes,
          },
          success: true,
          errors: [],
        },
      }
    }
  end

  it "returns a 200 HTTP code" do
    request
    expect(response).to have_http_status :ok
  end

  it "returns company details" do
    request
    expect(JSON.parse(response.body).deep_symbolize_keys).to include_json expected_result
  end
end
