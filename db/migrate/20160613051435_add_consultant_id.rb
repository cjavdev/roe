class AddConsultantId < ActiveRecord::Migration
  def change
    add_column :customers, :consultant_id, :integer, index: true
  end
end
