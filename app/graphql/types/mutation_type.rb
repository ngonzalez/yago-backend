module Types
  class MutationType < Types::BaseObject
    field :get_nace_bel_codes, mutation: Mutations::GetNaceBelCodes
  end
end
