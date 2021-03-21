class BarberSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :username, :zip_code, :photo
  has_many :barber_reviews, :photos
end
# create_table "barbers", force: :cascade do |t|
#   t.string "first_name"
#   t.string "last_name"
#   t.string "email"
#   t.string "username"
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
#   t.string "zip_code"
#   t.string "photo"
#   t.string "password_digest"
# end