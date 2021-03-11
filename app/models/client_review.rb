class ClientReview < ApplicationRecord
    belongs_to :barber
    belongs_to :client
end
