class ChangeUsersUsernameToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :username, :name
  end
end
