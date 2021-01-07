class ChangeSurveyDateTypeToDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :surveys, :date
  end
end
