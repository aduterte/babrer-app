class BarberReviewSerializer < ActiveModel::Serializer
  attributes :id, :barber_id, :rating, :content, :barber_review_comment, :created_at
  belongs_to :client
  

  def client
    client = {username: object.client.username, id: object.client.id, photo: object.client.photo}
    client
  end
end


# t.integer "rating"
# t.text "content"
# t.integer "barber_id"
# t.integer "client_id"