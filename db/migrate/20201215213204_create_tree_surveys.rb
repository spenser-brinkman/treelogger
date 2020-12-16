class CreateTreeSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :tree_surveys do |t|
      t.integer :survey_id
      t.integer :tree_id
      t.timestamps
    end
  end
end
