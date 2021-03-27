class AddColToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :last_read_at, :datetime
    add_reference :conversations, :barber, null: false, foreign_key: true
    add_reference :conversations, :client, null: false, foreign_key: true
  end
end
