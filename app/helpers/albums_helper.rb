module AlbumsHelper
  def album_path(album)
    super(album.category.slug, album.slug)
  end
end
