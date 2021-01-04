class AddUserIdToInspections < ActiveRecord::Migration[6.0]
  def change
    add_column :inspections, :user_id, :integer
  end
end
