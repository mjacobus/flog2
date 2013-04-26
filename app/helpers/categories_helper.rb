module CategoriesHelper
  def category_path(category)
    super(category.slug)
  end
end
