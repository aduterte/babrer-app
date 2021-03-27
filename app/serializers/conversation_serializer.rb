class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :c_last_read, :b_last_read
  has_many :messages
  belongs_to :client 
  belongs_to :barber

  def client
    # byebug
    {username: object.client.username, id: object.client.id, photo: object.client.photo}
  end

  def barber
    {username: object.barber.username, id: object.barber.id, photo: object.barber.photo}
  end
end
