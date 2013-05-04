module HomeHelper
  def home_albums
    Album.limit(5).order('RAND()')
  end
end
