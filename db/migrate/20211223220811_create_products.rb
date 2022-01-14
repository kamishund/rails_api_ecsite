class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :category
      t.string :image
      t.integer :price
      t.string :brand
      t.integer :rating,default: 0
      t.integer :numReviews,default: 0
      t.integer :countInStock,default: 0
      t.text :description
      t.timestamps
    end
  end
end
