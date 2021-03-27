class ClientReview < ApplicationRecord
    belongs_to :barber
    belongs_to :client

    has_one :client_review_comment, dependent: :destroy

end
