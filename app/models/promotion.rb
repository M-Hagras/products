# == Schema Information
#
# Table name: promotions
#
#  id         :integer          not null, primary key
#  active     :boolean
#  code       :string
#  discount   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Promotion < ApplicationRecord
  has_and_belongs_to_many :products
end
