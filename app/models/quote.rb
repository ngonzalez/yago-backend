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
class Quote < ActiveRecord::Base
  belongs_to :company

  has_paper_trail

  acts_as_paranoid
end
