# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Barber.destroy_all

Barber.create(first_name: "Alex", last_name: "D", email: "alexd@gmail.com", username: "nfamouswun", password: "password")
