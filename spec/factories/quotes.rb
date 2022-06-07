FactoryBot.define do
  factory :quote do
    available { true }
    coverage_ceiling { Faker::Number.leading_zero_number(digits: 10) }
    deductible { Faker::Number.between(from: 5_000, to: 10_000) }
    quote_id { "seniorTechChallenge#{rand(100000)}" }
    gross_premiums { "{\"afterDelivery\":43.2,\"publicLiability\":162,\"professionalIndemnity\":194.4,\"entrustedObjects\":54,\"legalExpenses\":64.8}" }
  end
end
