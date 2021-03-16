class AddZipCodeToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :zip_code, :string
  end
end
