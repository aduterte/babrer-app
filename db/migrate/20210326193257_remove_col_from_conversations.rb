class RemoveColFromConversations < ActiveRecord::Migration[6.0]
  def change
    remove_column :conversations, :last_read_at, :date
  end
end
