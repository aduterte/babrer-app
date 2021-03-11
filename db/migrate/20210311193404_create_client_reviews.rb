class CreateClientReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :client_reviews do |t|
      t.integer :rating
      t.text :content
      t.integer :barber_id
      t.integer :client_id

      t.timestamps
    end
  end
end
