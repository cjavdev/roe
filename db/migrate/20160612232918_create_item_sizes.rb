class CreateItemSizes < ActiveRecord::Migration
  def change
    create_table :item_sizes do |t|
      t.integer :item_id, null: false, index: true
      t.integer :size, null: false, index: true, default: 0
      t.boolean :sold, default: false

      t.timestamps null: false
    end
  end
end
