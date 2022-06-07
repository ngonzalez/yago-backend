# == Schema Information
#
# Table name: quotes
#
#  id               :bigint           not null, primary key
#  available        :boolean          default(TRUE), not null
#  coverage_ceiling :integer          not null
#  deductible       :integer          not null
#  deleted_at       :datetime
#  gross_premiums   :jsonb            not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_id       :integer          not null
#  quote_id         :string           not null
#
FactoryBot.define do
  factory :quote do
    available { true }
    coverage_ceiling { Faker::Number.leading_zero_number(digits: 10) }
    deductible { Faker::Number.between(from: 5_000, to: 10_000) }
    quote_id { "seniorTechChallenge#{rand(100000)}" }
    gross_premiums { "{\"afterDelivery\":43.2,\"publicLiability\":162,\"professionalIndemnity\":194.4,\"entrustedObjects\":54,\"legalExpenses\":64.8}" }
  end
end
