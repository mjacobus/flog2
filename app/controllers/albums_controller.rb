class AlbumsController < FrontendController
  def index
    @albums = Album.published.public.filter(clean_params).page(page).per(per_page)
    respond_with(@albums)
  end

  def show
    @album = Album.published.find_one_by(clean_params)

    if @album.secret? && @album.token != params[:token]
      raise ActiveRecord::RecordNotFound
    end

    respond_with(@album)
  end
end
