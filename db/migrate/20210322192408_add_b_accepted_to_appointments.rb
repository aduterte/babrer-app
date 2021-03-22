class AddBAcceptedToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :b_accepted, :boolean
  end
end
