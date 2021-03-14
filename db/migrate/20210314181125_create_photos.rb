class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :comment
      t.integer :order
      t.string :photo
      t.integer :barber_id

      t.timestamps
    end
  end
end
