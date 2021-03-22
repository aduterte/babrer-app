class AddCAcceptedToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :c_accepted, :boolean
  end
end
