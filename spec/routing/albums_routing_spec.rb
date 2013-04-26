require 'spec_helper'

describe AlbumsController, "#routing" do
  it "home routes to #index" do
    get('/').should route_to('albums#index')
    get('/2').should route_to('albums#index', page: '2')
  end

  it "routes to #show" do
    get('/category/album-name').should route_to(
      'albums#show', album: 'album-name', category: 'category'
    )
  end
end