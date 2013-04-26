class AlbumsController < FrontendController
  def index
    @albums = Album.published.filter(clean_params).page(page).per(per_page)
    respond_with(@albums)
  end

  def show
    @album = Album.published.find_one_by(clean_params)
    respond_with(@album)
  end
end
