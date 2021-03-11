class Client < ApplicationRecord
    has_secure_password
    has_many :barber_reviews
    has_many :barbers, through: :barber_reviews
    has_many :client_reviews
    has_many :barbers, through: :client_reviews
end
