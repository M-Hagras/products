# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

department_ids = []
for i in 1..10 do
  department = Department.create(name: 'Department' + i.to_s)
  department_ids.push(department.id) unless department.blank?
end

products_ids = []
for i in 1..10000 do
  product = Product.create(name: 'Product' + i.to_s, department_id: department_ids[rand(department_ids.length)], price: rand(10000))
  products_ids.push(product.id) unless product.blank?
end

for i in 1..50 do
  x = Promotion.create(code: "code#{i}", discount: rand(100))
  for j in 1..i
    y = products_ids[rand(products_ids.length)]
    Product.find(y).promotions << x unless y.blank?
  end
end