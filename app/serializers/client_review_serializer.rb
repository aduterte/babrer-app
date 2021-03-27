class ClientReviewSerializer < ActiveModel::Serializer

  attributes :id, :barber_id, :rating, :content, :created_at
  belongs_to :barber
  has_one :client_review_comment


  def barber
    barber = {username: object.barber.username, id: object.barber.id, photo: object.barber.photo}
    barber
  end
end
