# README

Rails api to handle prototype of simple products

Entities of the APIs:
* Department: 
           <br>-name
* Product: <br>-name
           <br>-price
           <br>-department
           <br>-set of promotions
* Promotion: 
           <br>-code
           <br>-discount 
           
Supported APIs:
* Department
           <br>-index: gets all departments
           <br>-show/{id}: gets data of the department with passed ID
           <br>-create: creates new record with passed data
           <br>-destroy/{id}: destroy department with ID
           
* Product
          <br>-index: gets all products
          <br>-show/{id}: gets data of the product with passed ID
          <br>-search: search products with different options [department_id, promotion_id, product_name]
          <br>-create: creates new record with passed data
          <br>-destroy/{id}: destroy product with ID
          
* Promotion
          <br>-index: gets all promotions
          <br>-show/{id}: gets data of the promotion with passed ID
          <br>-create: creates new record with passed data
          <br>-destroy/{id}: destroy promotion with ID
          
Used Gems:<br>
          -annotate: to generate schema in model file to enhance readability<br>
          -cors: to enable cross-origin ajax
          -kaminari: to handle pagination of data
          -rspec: to test our search class
          
* Ruby version 2.5

To run the project:
* move to project folder
* run `bundle install` to install gems
* run `rails db:setup` to do some initial magic by creating database, runing migrations and finally running seeed
* Run using `rails s`, but make sure you are using port 3000 as frontend is depending on port 3000
* Seed will create some random data
* All APIs exposed as v1 to enable future versions of APP