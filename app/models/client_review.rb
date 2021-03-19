class ClientReview < ApplicationRecord
    belongs_to :barber
    belongs_to :client
    has_many :client_review_comments
end
