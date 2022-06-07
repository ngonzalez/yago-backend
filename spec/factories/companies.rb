# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  annual_revenue    :integer          not null
#  deleted_at        :datetime
#  enterprise_number :string           not null
#  legal_name        :string           not null
#  nace_bel_codes    :jsonb
#  natural_person    :boolean          default(TRUE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :company do
    enterprise_number { Faker::Number.leading_zero_number(digits: 10) }
    annual_revenue { Faker::Number.between(from: 5_000, to: 10_000) }
    legal_name { Faker::Company.name }
    nace_bel_codes { "[\"05200\"]" }
  end
end
