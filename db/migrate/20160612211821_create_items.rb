class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.attachment :photo
      t.string :name, null: false, index: true
      t.integer :user_id, null: false, index: true
      t.integer :collection_id, index: true
      t.boolean :public, default: true

      t.timestamps null: false
    end
  end
end
