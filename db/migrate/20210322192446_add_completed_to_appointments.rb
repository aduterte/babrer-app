class AddCompletedToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :completed, :boolean
  end
end
