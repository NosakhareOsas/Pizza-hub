# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroy all..."

Restaurant.destroy_all
Pizza.destroy_all
RestaurantPizza.destroy_all
puts "destroy done"

puts "seeding in progress..."

md = Restaurant.create!(name: "Macdonalds", address: "60 York Ave")
cc = Restaurant.create!(name: "Crusty Crab", address: "7 New London")
mb = Restaurant.create!(name: "Mr Biggs", address: "82 West Lagos")

rr = Pizza.create!(name: "Rocket Red", ingredients: "Tomato, Pepper and Greens")
pt = Pizza.create!(name: "Pineapple toppings", ingredients: "Fresh tomatoes and Pineapple slices")

RestaurantPizza.create!(price: 25, restaurant: md, pizza: rr)
RestaurantPizza.create!(price: 30, restaurant: md, pizza: pt)

RestaurantPizza.create!(price: 23, restaurant: cc, pizza: rr)

RestaurantPizza.create!(price: 26, restaurant: mb, pizza: rr)
RestaurantPizza.create!(price: 28, restaurant: mb, pizza: pt)

puts "seeding done!"