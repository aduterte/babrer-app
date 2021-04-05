class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :c_last_read, :b_last_read, :messages
  belongs_to :client 
  belongs_to :barber

  def messages
    ActiveModel::SerializableResource.new(object.messages, each_serializer: MessageSerializer)
  end

  def client
    # byebug
    {username: object.client.username, id: object.client.id, photo: object.client.photo}
  end

  def barber
    {username: object.barber.username, id: object.barber.id, photo: object.barber.photo}
  end
end
