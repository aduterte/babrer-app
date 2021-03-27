class AddCbReadToConversations < ActiveRecord::Migration[6.0]
  def change
    add_column :conversations, :c_last_read, :date
    add_column :conversations, :b_last_read, :date
  end
end
