class ChangePropertiesAddressToTitle < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :address, :title
  end
end
