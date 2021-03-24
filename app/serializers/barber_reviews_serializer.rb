class BarberReviewsSerializer < ActiveModel::Serializer
  attributes :id, :barber_id, :rating, :content
  belongs_to :client
  has_many :barber_review_comment

  def client
    client = {username: object.client.username, id: object.client.id, photo: object.client.photo}
    client
  end
end


# t.integer "rating"
# t.text "content"
# t.integer "barber_id"
# t.integer "client_id"