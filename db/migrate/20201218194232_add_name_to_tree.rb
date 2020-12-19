class AddNameToTree < ActiveRecord::Migration[6.0]
  def change
    add_column :trees, :name, :string
  end
end
