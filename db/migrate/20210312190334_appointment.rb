class Appointment < ActiveRecord::Migration[6.0]
  def change
    create_table :client_reviews do |t|
      t.datetime :date
      t.integer :barber_id
      t.integer :client_id

  end
end
