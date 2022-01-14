class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :paymentMethod
      t.integer :itemsPrice
      t.integer :shippingPrice
      t.integer :taxPrice
      t.integer :totalPrice
      t.boolean :isPaid
      t.boolean :isDelivered
      t.string :paidAt
      t.string :deliveredAt
      t.timestamps
    end
  end
end
