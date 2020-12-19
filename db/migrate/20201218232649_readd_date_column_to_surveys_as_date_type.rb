class ReaddDateColumnToSurveysAsDateType < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :date, :date
  end
end
