require 'spec_helper'

describe HomeController, "#rougint" do
  it "routes to index" do
    get('/').should route_to('home#index')
  end
end