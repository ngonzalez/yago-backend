require "rails_helper"

RSpec.describe Mutations::GetNaceBelCodes do
  context "Mutations" do
    it "Get Nace-Bel codes" do
      variables = {
        level: 1,
        parentCode: "",
      }

      query = GraphQL::Query.new(
        YagoBackendSchema,
        mutation,
        variables: variables.deep_stringify_keys,
        context: {},
      )

      result = query.result

      expect(result.dig("data", "getNaceBelCodes", "naceBelCodes")).to eq([])
    end
  end

  def mutation
    <<~GQL
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
    GQL
  end
end
