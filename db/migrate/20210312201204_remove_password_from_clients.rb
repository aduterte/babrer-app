class RemovePasswordFromClients < ActiveRecord::Migration[6.0]
  def change
    remove_column :clients, :password, :string
  end
end
