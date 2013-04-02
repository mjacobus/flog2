class AddSequenceToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :sequence, :integer, default: 0
  end
end
