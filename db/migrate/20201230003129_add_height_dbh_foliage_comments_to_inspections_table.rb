class AddHeightDbhFoliageCommentsToInspectionsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :inspections, :height, :integer
    add_column :inspections, :dbh, :integer
    add_column :inspections, :foliage, :string
    add_column :inspections, :comments, :text
  end
end
