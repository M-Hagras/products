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
FactoryGirl.define do
  factory :promotion do
    code "MyString"
    active false
    discount 1
  end
end
