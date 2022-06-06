# == Schema Information
#
# Table name: nace_bel_codes
#
#  id          :bigint           not null, primary key
#  code        :string
#  label_de    :string
#  label_en    :string
#  label_fr    :string
#  label_nl    :string
#  level       :integer          not null
#  parent_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_nacebel_codes_on_code         (code)
#  index_nacebel_codes_on_parent_code  (parent_code)
#
class NaceBelCode < ActiveRecord::Base
  validates_presence_of :level
end
