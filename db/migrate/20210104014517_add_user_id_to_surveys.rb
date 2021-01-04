class AddUserIdToSurveys < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :user_id, :integer
  end
end
