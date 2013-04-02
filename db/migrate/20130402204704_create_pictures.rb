class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.string :picturable_type
      t.integer :picturable_id
      t.attachment :file
      t.timestamps
    end
  end
end
