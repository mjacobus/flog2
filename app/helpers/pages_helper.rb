module PagesHelper
  def menu_pages
    Page.where('menu_order IS NOT NULL').order(:menu_order)
  end
end
