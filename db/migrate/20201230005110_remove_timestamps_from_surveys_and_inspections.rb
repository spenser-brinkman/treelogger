class RemoveTimestampsFromSurveysAndInspections < ActiveRecord::Migration[6.0]
  def change
    remove_column :surveys, :created_at
    remove_column :surveys, :updated_at
    remove_column :inspections, :created_at
    remove_column :inspections, :updated_at
  end
end
