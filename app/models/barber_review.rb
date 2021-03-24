class BarberReview < ApplicationRecord
    belongs_to :client
    belongs_to :barber
    has_many :barber_review_comment
end
