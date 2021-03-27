class BarberReview < ApplicationRecord
    belongs_to :client
    belongs_to :barber

    has_one :barber_review_comment, dependent: :destroy

end
