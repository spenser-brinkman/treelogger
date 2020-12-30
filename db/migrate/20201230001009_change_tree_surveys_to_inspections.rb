class ChangeTreeSurveysToInspections < ActiveRecord::Migration[6.0]
  def change
    rename_table :tree_surveys, :inspections
  end
end
