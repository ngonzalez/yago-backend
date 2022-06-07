FactoryBot.define do
  factory :company do
    enterprise_number { Faker::Number.leading_zero_number(digits: 10) }
    annual_revenue { Faker::Number.between(from: 5_000, to: 10_000) }
    legal_name { Faker::Company.name }
    nace_bel_codes { "[\"05200\"]" }
  end
end
