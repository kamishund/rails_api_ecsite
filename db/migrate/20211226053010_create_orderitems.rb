class CreateOrderitems < ActiveRecord::Migration[6.0]
  def change
    create_table :orderitems do |t|

      t.references :order
      t.string :name
      t.string :image
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
