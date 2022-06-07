require "rails_helper"

RSpec.describe "Get NACE-BEL codes" do
  subject(:request) {
    post "/graphql", headers: { 'Content-Type' => 'application/json' }, params: { query: query, variables: variables }.to_json
  }
  let(:query) do
    <<~GRAPHQL
    mutation getNaceBelCodes(
      $level: Int!,
      $parentCode: String!,
    ) {
      getNaceBelCodes(input: {
        level: $level,
        parentCode: $parentCode,
      }) {
        naceBelCodes {
          id
          level
          code
          parentCode
          labelEn
          labelFr
          labelNl
          labelDe
        }
        success
        errors
      }
    }
    GRAPHQL
  end
  let(:variables) do
    {
      level: 1,
      parentCode: "",
    }
  end
  let(:expected_result) do
    {
      data: {
        getNaceBelCodes: {
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

  it "returns NACE-BEL codes" do
    request
    expect(JSON.parse(response.body).deep_symbolize_keys).to include_json expected_result
  end
end
