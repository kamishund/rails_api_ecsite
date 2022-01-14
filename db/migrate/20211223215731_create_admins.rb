class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|

    t.references :user
    t.boolean :admin, default: false, null: false
    t.timestamps
    end
  end
end