class Barber < ApplicationRecord
    has_secure_password
    has_many :client_reviews
    has_many :clients, through: :client_reviews
    has_many :barber_reviews
    has_many :clients, through: :barber_reviews
    has_one_attached :avatar
    has_many :photos
    has_many :appointments
    has_many :conversations
    has_many :messages, through: :conversations
end
