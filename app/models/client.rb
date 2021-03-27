class Client < ApplicationRecord
    has_secure_password
    has_many :barber_reviews
    has_many :barbers, through: :barber_reviews
    has_many :client_reviews
    has_many :barbers, through: :client_reviews
    has_one_attached :avatar
    has_many :appointments
    has_many :conversations
end
