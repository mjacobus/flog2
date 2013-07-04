class AddSecretAndTokenToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :secret, :boolean, default: false
    add_column :albums, :token, :string
  end
end
