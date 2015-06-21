# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name = 'Chicago' }, { name = 'Copenhagen' }])
#   Mayor.create(name = 'Emanuel', city = cities.first)

# User admin
olivier = User.find_or_create_by(email: "olivier.smith@yahoo.com") do |user|
  user.firstname = "Olivier"
  user.lastname = "Smith"
  user.password = "as6758qp"
  user.password_confirmation = "as6758qp"
  user.admin = true
end

# Users
User.find_or_create_by(email: "o.johason@gmail.com") do |user|
  user.firstname = "Olivia"
  user.lastname = "Johanson"
  user.password = "gb1029bh"
  user.password_confirmation = "gb1029bh"
end

jacob = User.find_or_create_by(email: "jacobwilliams@gmail.com") do |user|
  user.firstname = "Jacob"
  user.lastname = "Williams"
  user.password =  "56ib86be"
  user.password_confirmation = "56ib86be"
end

lily = User.find_or_create_by(email: "lily.jones@yahoo.com") do |user|
  user.firstname = "Lily"
  user.lastname = "Jones"
  user.password = "98ljyh67"
  user.password_confirmation = "98ljyh67"
end

alex = User.find_or_create_by(email: "alex.brown@gmail.com") do |user|
  user.firstname = "Alex"
  user.lastname = "Brown"
  user.password = "a493948b"
  user.password_confirmation = "a493948b"
end

User.find_or_create_by(email:  "davis.amber@gmail.com") do |user|
  user.firstname = "Amber"
  user.lastname = "Davis"
  user.password = "jk4509ad"
  user.password_confirmation = "jk4509ad"
end

# Category
category = Category.find_or_create_by(name: "Food") do |category|
            category.name = "Food"
          end
# Product
product1 = category.products.find_or_create_by(title: "Gluten free Pene Pasta") do |product|
  product.description = "Penne Pasta is made with a wholesome blend of corn and rice.
    This pasta has the same traditional appearance,
    flavor and texture as regular penne,
    and it makes an excellent choice for meal planning.
    This pasta is gluten, wheat and dairy free,
    and it is an ideal meal solution for individuals who have dietary restrictions."
  product.price = 5
  product.category = category
  product.user = lily
end

product2 = category.products.find_or_create_by(title: "Dark chocolate") do |product|
  product.description = "90% dak chocolate with deep aroma. With unforgetable taste."
  product.price = 7
  product.category = category
  product.user = olivier
end

# Review
product1.reviews.find_or_create_by(content: "This pasta has the mouth feel and taste of regular pasta.
  I cook the Penne a little longer than the package suggests.") do |review|
  review.rating = 5
  review.user = olivier
end

product1.reviews.find_or_create_by(content: "Good diet substitude for regular pasta.") do |review|
  review.rating = 4
  review.user = lily
end

product2.reviews.find_or_create_by(content: "This chocolate has anti-oxidant benefit for medicine.") do |review|
  review.rating = 5
  review.user = alex
end

product2.reviews.find_or_create_by(content: "When I open my last bar it was white. I'm vary disappointed") do |review|
  review.rating = 2
  review.user = olivier
end

product2.reviews.find_or_create_by(content: "It's quite good but the price is to big.") do |review|
  review.rating = 3
  review.user = jacob
end
