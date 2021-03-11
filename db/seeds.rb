# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Barber.destroy_all
Client.destroy_all
BarberReview.destroy_all

alex = Barber.create(first_name: "Alex", last_name: "D", email: "alexd@gmail.com", username: "nfamouswun", password: "password")
danny = Client.create(first_name: "Danny", last_name: "S", email: "danny@test.com", username: "dsuccar", password: "password")

BarberReview.create(barber: alex, client: danny, rating: 1, content: "he fucked my shit up")