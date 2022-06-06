module Types
  class Company < BaseObject
    graphql_name "Company"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :annual_revenue, String, null: false
    field :enterprise_number, String, null: false
    field :legal_name, String, null: false
    field :natural_person, Boolean, null: false
    field :nace_bel_codes, GraphQL::Types::JSON, null: false
  end
end
