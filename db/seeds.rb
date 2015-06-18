# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User admin
User.where(email: "olivier.smith@yahoo.com").first_or_create!(
  firstname: "Olivier",
  lastname: "Smith",
  email: "olivier.smith@yahoo.com",
  password: "as6758qp",
  password_confirmation: "as6758qp",
  admin: true)
# Users
User.where(email: "o.johason@gmail.com").first_or_create!(
  firstname: "Olivia",
  lastname: "Johanson" ,
  email: "o.johason@gmail.com",
  password: "gb1029bh",
  password_confirmation: "gb1029bh")

User.where(email: "jacobwilliams@gmail.com").first_or_create!(
  firstname: "Jacob",
  lastname: "Williams",
  email: "jacobwilliams@gmail.com",
  password:  "56ib86be",
  password_confirmation: "56ib86be")

User.where(email: "lily.jones@yahoo.com").first_or_create!(
  firstname: "Lily",
  lastname: "Jones",
  email: "lily.jones@yahoo.com",
  password: "98ljyh67",
  password_confirmation: "98ljyh67")

User.where(email: "alex.brown@gmail.com").first_or_create!(
  firstname: "Alex",
  lastname: "Brown",
  email: "alex.brown@gmail.com",
  password: "a493948b",
  password_confirmation: "a493948b")

User.where(email:  "davis.amber@gmail.com").first_or_create!(
  firstname: "Amber",
  lastname: "Davis",
  email:  "davis.amber@gmail.com",
  password: "jk4509ad",
  password_confirmation: "jk4509ad")

# Category
category = Category.where(name: "Food").first_or_create! name: "Food"

# Product
product1 = category.products.create! title: "Gluten free Pene Pasta",
                description: "Penne Pasta is made with a wholesome blend of corn and rice.
                  This pasta has the same traditional appearance,
                  flavor and texture as regular penne,
                  and it makes an excellent choice for meal planning.
                  This pasta is gluten, wheat and dairy free,
                  and it is an ideal meal solution for individuals who have dietary restrictions.",
                price: "$2"

product2 = category.products.create! title: "Dark chocolate",
                description: "90% dak chocolate with deep aroma. With unforgetable taste.",
                price: "$3"


# Review
product1.reviews.create! content: "This pasta has the mouth feel and taste of regular pasta.
                                  I cook the Penne a little longer than the package suggests.",
                         rating: 5,
                         user_id: 1

product1.reviews.create! content: "Good diet substitude for regular pasta.",
                         rating: 4,
                         user_id: 4

product2.reviews.create! content: "This chocolate has anti-oxidant benefit for medicine.",
                         rating: 5,
                         user_id: 5

product2.reviews.create! content: "When I open my last bar it was white. I'm vary disappointed",
                         rating: 2,
                         user_id: 1

product2.reviews.create! content: "It's quite good but the price is to big.",
                         rating: 3,
                         user_id: 3
