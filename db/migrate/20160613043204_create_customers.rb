class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, index: true
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :email, index: true
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
