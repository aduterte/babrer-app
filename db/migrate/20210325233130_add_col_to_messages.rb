class AddColToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :barber, null: false, foreign_key: true
    add_reference :messages, :client, null: false, foreign_key: true
  end
end
