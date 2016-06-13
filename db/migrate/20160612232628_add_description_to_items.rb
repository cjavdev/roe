class AddDescriptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :description, :text
    add_column :items, :color, :string
  end
end
