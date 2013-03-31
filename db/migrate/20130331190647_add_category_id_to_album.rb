class AddCategoryIdToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :category_id, :integer
    add_index :albums, :category_id
  end
end
