class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :username, :zip_code, :photo, :client_reviews, :appointments, :conversations
  
  # has_many 
  def conversations
    ActiveModel::SerializableResource.new(object.conversations, each_serializer: ConversationSerializer)
  end
  
  def client_reviews
    # byebug
    ActiveModel::SerializableResource.new(object.client_reviews, each_serializer: ClientReviewSerializer)
  end

  def appointments 
    ActiveModel::SerializableResource.new(object.appointments, each_serializer: AppointmentsCSerializer)
  end
end
