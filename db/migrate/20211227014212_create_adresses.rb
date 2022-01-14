class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.references :order
      t.string :fullName
      t.string :address
      t.string :city
      t.string :postalCode
      t.string :country
      t.timestamps
    end
  end
end
