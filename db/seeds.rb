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
ClientReview.destroy_all
BarberReview.destroy_all
ClientReviewComment.destroy_all
Appointment.destroy_all

BarberReviewComment.destroy_all
linds = Barber.create(first_name: "Linds", last_name: "M", email: "b", username: "LindsMonty", password: "b")
alex = Barber.create(first_name: "Alex", last_name: "D", email: "alexd@gmail.com", username: "nfamouswun", password: "password")
danny = Client.create(first_name: "Danny", last_name: "S", email: "danny@test.com", username: "dsuccar", password: "password")
kanye = Client.create(first_name: "Kanye", last_name: "W", email: "a", username: "KanyeToDa", password: "a")

uzo = Client.create(first_name: "Uzo", last_name: "x", email: "c", username: "Uzo", password: "c")

appointment = Appointment.create({client_id: kanye.id, barber_id: alex.id, b_accepted:true, c_accepted:false, date: DateTime.new(2021,3,27, 4,0), completed: false})
appointment2 = Appointment.create({client_id: kanye.id, barber_id: alex.id, b_accepted:true, c_accepted:true, date: DateTime.new(2021,3,27, 4,0)})

kanye_review = BarberReview.create(barber: alex, client: kanye, rating: 5, content: "i voted for you, ye")
kanye_review2 = ClientReview.create(barber: linds, client: kanye, rating: 5, content: "hes feet were a little stinky")
ClientReview.create(barber: alex, client: kanye, rating: 3, content: "keept on asking me about my feet")
ClientReview.create(barber: alex, client: danny, rating: 3, content: "keept on asking me about my feet")
BarberReviewComment.create(barber_id: alex.id , barber_review_id: kanye_review.id, content: "IM A FUCKING WALKING ALEX... no im not")
ClientReviewComment.create(client_id: kanye.id , client_review_id: kanye_review2.id, content: "IM A FUCKING KANYE TO DA")
# BarberReviewComment.create(barber_id: linds.id , barber_review: kanye_review2, content: "CHICKEn BATTER ON EVERYTHING")

# 25.times do 
#   first_name = Faker::Name.first_name  
#   last_name = Faker::Name.last_name 
#   barbers = Barber.new(
#     first_name: first_name,
#     last_name: last_name ,
#     email: first_name+last_name+"@barbers.com"    ,
#     password:"123",
#     username: "barber" + last_name ,
#   )

#   clients = Client.new(
#     first_name: first_name,
#     last_name: last_name ,
#     email: first_name+last_name+"@client.com",
#     password:"123",
#     username: "client" + last_name,
#   )

#   barbers.save
#   clients.save
# end