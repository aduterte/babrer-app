class AppointmentsBSerializer < ActiveModel::Serializer
  attributes :id, :b_accepted, :c_accepted, :completed, :date
  belongs_to :client
  

  def client 
    {username: object.client.username, id: object.client.id, email: object.client.email, photo: object.client.photo}
  end
end
