class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :sale_id, null: false, index: true
      t.integer :item_id, null: false, index: true

      t.timestamps null: false
    end

    add_index :sale_items, [:sale_id, :item_id]
  end
end
