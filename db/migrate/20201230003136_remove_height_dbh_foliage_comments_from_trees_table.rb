class RemoveHeightDbhFoliageCommentsFromTreesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :trees, :height
    remove_column :trees, :dbh
    remove_column :trees, :foliage
    remove_column :trees, :comments
  end
end
