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
require 'rails_helper'

RSpec.describe Product, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
