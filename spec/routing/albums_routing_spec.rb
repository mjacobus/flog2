require 'spec_helper'

describe AlbumsController, "#routing" do
  it "routes to #show" do
    get('/category/album-name').should route_to(
      'albums#show', album: 'album-name', category: 'category'
    )
  end
end