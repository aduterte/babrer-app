class Photo < ApplicationRecord
    belongs_to :barber
    has_one_attached :image
end
