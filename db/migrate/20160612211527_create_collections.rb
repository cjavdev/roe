class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title, null: false, index: true
      t.attachment :leading_photo
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
