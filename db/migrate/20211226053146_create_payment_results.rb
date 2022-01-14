class CreatePaymentResults < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_results do |t|
      t.references :order
      t.string :status
      t.string :emailAddress
      t.timestamps
    end
  end
end
