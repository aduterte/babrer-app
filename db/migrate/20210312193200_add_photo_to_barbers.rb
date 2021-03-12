class AddPhotoToBarbers < ActiveRecord::Migration[6.0]
  def change
    add_column :barbers, :photo, :string
  end
end
