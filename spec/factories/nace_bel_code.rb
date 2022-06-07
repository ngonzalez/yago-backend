FactoryBot.define do
  factory :nace_bel_code do
    level { 1 }
    code { "1" }
    parent_code { "-" }
    label_en { "test_en_#{rand(1000)}" }
    label_de { "test_de_#{rand(1000)}" }
    label_nl { "test_nl_#{rand(1000)}" }
    label_fr { "test_fr_#{rand(1000)}" }
  end
end
