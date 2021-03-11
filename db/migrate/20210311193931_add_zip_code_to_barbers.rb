class AddZipCodeToBarbers < ActiveRecord::Migration[6.0]
  def change
    add_column :barbers, :zip_code, :string
  end
end
