class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :text, :created_at, :sent_by
  belongs_to :client 
  belongs_to :barber

  
  def client
    # byebug
    {username: object.conversation.client.username, id: object.conversation.client.id, photo: object.conversation.client.photo}
  end

  def barber
    {username: object.conversation.barber.username, id: object.conversation.barber.id, photo: object.conversation.barber.photo}
  end
end
