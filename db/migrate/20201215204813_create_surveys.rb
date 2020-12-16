class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.integer :property_id
      t.string :date
      t.timestamps
    end
  end
end
