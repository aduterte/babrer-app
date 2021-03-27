class Conversation < ApplicationRecord
    has_many :messages
    belongs_to :client
    belongs_to :barber
end
