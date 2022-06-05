module Types
  class NaceBelCode < Types::BaseObject
    graphql_name "NaceBelCode"

    implements GraphQL::Types::Relay::Node
    global_id_field :id

    field :level, Integer, null: false
    field :code, String
    field :parent_code, String
    field :label_fr, String
    field :label_en, String
    field :label_nl, String
    field :label_de, String
  end
end
