# == Schema Information
#
# Table name: covers
#
#  id         :bigint           not null, primary key
#  amount     :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  quote_id   :integer          not null
#
class Cover < ActiveRecord::Base
  belongs_to :quote, class_name: "Quote", foreign_key: :quote_id

  has_paper_trail

  acts_as_paranoid
end
