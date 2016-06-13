class DefaultPaidToFalse < ActiveRecord::Migration
  def change
    change_column :sales, :paid, :boolean, default: false
  end
end
