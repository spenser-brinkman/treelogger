class MakeTodayDefaultValueForSurveyDate < ActiveRecord::Migration[6.0]
  def change
    change_column :surveys, :date, :string, default: "#{DateTime.now.strftime("%Y-%m-%d")}"
  end
end
