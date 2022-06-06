module Types
  class Quote < BaseObject
    graphql_name "Quote"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :available, Boolean, null: false
    field :coverage_ceiling, Integer, null: false
    field :deductible, Integer, null: false
    field :remote_quote_id, String, null: false
    field :gross_premiums, GraphQL::Types::JSON, null: false
  end
end
