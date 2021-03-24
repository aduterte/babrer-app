class ClientReviewsSerializer < ActiveModel::Serializer
  attributes :id, :barber_id, :rating, :content
  belongs_to :barber
  has_many :client_review_comment

  def barber
    barber = {username: object.barber.username, id: object.barber.id, photo: object.barber.photo}
    barber
  end
end
