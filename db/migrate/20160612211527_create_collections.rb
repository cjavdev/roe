class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :title
      t.string :leading_photo
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
