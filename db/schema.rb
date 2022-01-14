# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_27_014212) do

  create_table "admins", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "adresses", force: :cascade do |t|
    t.integer "order_id"
    t.string "fullName"
    t.string "address"
    t.string "city"
    t.string "postalCode"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_adresses_on_order_id"
  end

  create_table "orderitems", force: :cascade do |t|
    t.integer "order_id"
    t.string "name"
    t.string "image"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_orderitems_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.string "paymentMethod"
    t.integer "itemsPrice"
    t.integer "shippingPrice"
    t.integer "taxPrice"
    t.integer "totalPrice"
    t.boolean "isPaid"
    t.boolean "isDelivered"
    t.string "paidAt"
    t.string "deliveredAt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_results", force: :cascade do |t|
    t.integer "order_id"
    t.string "status"
    t.string "emailAddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_payment_results_on_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "category"
    t.string "image"
    t.integer "price"
    t.string "brand"
    t.integer "rating", default: 0
    t.integer "numReviews", default: 0
    t.integer "countInStock", default: 0
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.string "name"
    t.integer "rating", default: 0
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.integer "order_id"
    t.string "fullName"
    t.string "address"
    t.string "city"
    t.string "postalCode"
    t.string "country"
    t.string "locationLat"
    t.string "locationLng"
    t.string "locationAddress"
    t.string "locationName"
    t.string "locationVicinity"
    t.string "locationGoogleAddressId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_shipping_addresses_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end
