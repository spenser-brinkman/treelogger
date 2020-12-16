class CreateTrees < ActiveRecord::Migration[6.0]
  def change
    create_table :trees do |t|
      t.integer :height
      t.integer :dbh
      t.string :foliage
      t.text :comments
      t.integer :species_id
    end
  end
end
