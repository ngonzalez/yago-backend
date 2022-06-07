require "rails_helper"

RSpec.describe "Creates a company" do
  subject(:request) {
    post "/graphql", headers: { 'Content-Type' => 'application/json' }, params: { query: query, variables: variables }.to_json
  }
  let(:query) do
    <<~GRAPHQL
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
    GRAPHQL
  end
  let(:variables) do
    {
      annualRevenue: Faker::Number.between(from: 5_000, to: 10_000),
      enterpriseNumber: Faker::Number.leading_zero_number(digits: 10),
      legalName: Faker::Company.name,
      naturalPerson: true,
      naceBelCodes: "[\"05200\"]"
    }
  end
  let(:expected_result) do
    {
      data: {
        createCompany: {
          company: {
            annualRevenue: variables[:annualRevenue].to_s,
            enterpriseNumber: variables[:enterpriseNumber],
            legalName: variables[:legalName],
            naturalPerson: variables[:naturalPerson],
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
