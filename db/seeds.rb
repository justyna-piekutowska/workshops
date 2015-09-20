# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name = 'Chicago' }, { name = 'Copenhagen' }])
#   Mayor.create(name = 'Emanuel', city = cities.first)

# User admin
unless User.find_by(email: "admin@yahoo.com")
  User.create(email: "admin@yahoo.com",
    firstname: FFaker::Name.first_name,
    lastname: FFaker::Name.last_name,
    password: password123,
    admin: true
    )
end

# Users
5.times do
  User.create(email: FFaker::Internet.email,
    password: FFaker::Internet.password,
    admin: false,
    firstname: FFaker::Name.first_name,
    lastname: FFaker::Name.last_name
    )
end

# Category
category = Category.find_or_create_by(name: "Food") do |category|
            category.name = "Food"
          end
# Products
10.times do
  Product.create(title: FFaker::Food.vegetable,
    description: FFaker::DizzleIpsum.paragraph,
    price: rand(50),
    user_id: rand(1..6),
    category: category
    )
end

# Reviews
30.times do
  Review.create(content: FFaker::DizzleIpsum.paragraph,
    rating: rand(1..5),
    product_id: rand(1..10),
    user_id: rand(1..6)
    )
end
