# == Schema Information
#
# Table name: companies
#
#  id                :bigint           not null, primary key
#  annual_revenue    :integer          not null
#  deleted_at        :datetime
#  enterprise_number :string           not null
#  legal_name        :string           not null
#  nacebel_codes     :jsonb
#  natural_person    :boolean          default(TRUE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Company < ActiveRecord::Base
  has_many :quotes, class_name: "Quote", dependent: :destroy, foreign_key: :company_id

  has_paper_trail

  acts_as_paranoid
end
