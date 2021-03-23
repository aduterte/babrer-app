class AppointmentsCSerializer < ActiveModel::Serializer
  attributes :id, :b_accepted, :c_accepted, :completed, :date
  belongs_to :barber
  
  
  def barber 
    # byebug
    {username: object.barber.username, id: object.barber.id, email: object.barber.email, photo: object.barber.photo}
  end
end
