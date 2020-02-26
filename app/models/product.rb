# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  name          :string
#  price         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#
# Indexes
#
#  index_products_on_department_id  (department_id)
#
class Product < ApplicationRecord
  belongs_to :department
  has_and_belongs_to_many :promotions
end
