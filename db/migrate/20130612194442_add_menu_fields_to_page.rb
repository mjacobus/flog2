class AddMenuFieldsToPage < ActiveRecord::Migration
  def change
    add_column :pages, :menu_order, :integer
  end
end
