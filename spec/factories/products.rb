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
FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1
    department nil
  end
end
