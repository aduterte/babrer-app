class RemoveCbLastReadFromConversations < ActiveRecord::Migration[6.0]
  def change
    remove_column :conversations, :b_last_read, :date
    remove_column :conversations, :c_last_read, :date
  end
end
