class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :product
      t.string :name
      t.integer :rating,default: 0
      t.text :comment

      t.timestamps
    end
  end
end
