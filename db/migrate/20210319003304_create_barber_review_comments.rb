class CreateBarberReviewComments < ActiveRecord::Migration[6.0]
  def change
    create_table :barber_review_comments do |t|
      t.text :content
      t.integer :barber_review_id
      t.integer :barber_id
      t.timestamps
    end
  end
end
