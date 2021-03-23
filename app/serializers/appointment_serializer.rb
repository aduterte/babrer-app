class AppointmentSerializer < ActiveModel::Serializer
    attributes :id, :b_accepted, :c_accepted, :completed, :date
    belongs_to :barber
    belongs_to :client
  

    def client 
      {username: object.client.username, id: object.client.id, email: object.client.email, photo: object.client.photo}
    end
    
    def barber 
      # byebug
      {username: object.barber.username, id: object.barber.id, email: object.barber.email, photo: object.barber.photo}
    end
  end
  