module HomeHelper
  def home_pictures
    Picture.home.order('RAND()')
  end
end
