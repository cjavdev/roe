class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :customer_id
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
