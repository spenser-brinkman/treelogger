class AddUserAndPropertyIdToTrees < ActiveRecord::Migration[6.0]
  def change
    add_column :trees, :user_id, :integer
    add_column :trees, :property_id, :integer
  end
end
