module Types
  class MutationType < Types::BaseObject
    field :get_nace_bel_codes, mutation: Mutations::GetNaceBelCodes
    field :create_company, mutation: Mutations::CreateCompany
    field :create_quote, mutation: Mutations::CreateQuote
    field :get_quote, mutation: Mutations::GetQuote
    field :get_company, mutation: Mutations::GetCompany
  end
end
