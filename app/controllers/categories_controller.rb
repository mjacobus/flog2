class CategoriesController < FrontendController
  def index
    @category = Category.find_by_slug(params[:category])
    @albums = @category.albums.published.page(page).per(per_page)
    respond_with(@albums)
  end
end
