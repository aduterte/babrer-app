class CreateClientReviewComments < ActiveRecord::Migration[6.0]
  def change
    create_table :client_review_comments do |t|
      t.text :content
      t.integer :client_review_id
      t.integer :client_id

      t.timestamps
    end
  end
end
