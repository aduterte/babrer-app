# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Barber.destroy_all
Client.destroy_all
BarberReview.destroy_all

alex = Barber.create(first_name: "Alex", last_name: "D", email: "alexd@gmail.com", username: "nfamouswun", password: "password")
danny = Client.create(first_name: "Danny", last_name: "S", email: "danny@test.com", username: "dsuccar", password: "password")

BarberReview.create(barber: alex, client: danny, rating: 1, content: "he fucked my shit up")


25.times do 
  first_name = Faker::Name.first_name  
  last_name = Faker::Name.last_name 
  barbers = Barber.new(
    first_name: first_name,
    last_name: last_name ,
    email: first_name+last_name+"@barbers.com"    ,
    password:"123",
    username: "barber" + last_name ,
  )

  clients = Client.new(
    first_name: first_name,
    last_name: last_name ,
    email: first_name+last_name+"@client.com",
    password:"123",
    username: "client" + last_name,
  )

  barbers.save
  clients.save
end