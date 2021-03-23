class ClientsSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :username, :zip_code, :photo, :client_reviews, :appointments
  
  # has_many 

  def client_reviews
    # byebug
    ActiveModel::SerializableResource.new(object.barber_reviews, each_serializer: ClientReviewsSerializer)
  end

  def appointments 
    ActiveModel::SerializableResource.new(object.appointments, each_serializer: AppointmentsCSerializer)
  end
end
