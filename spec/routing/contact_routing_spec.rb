require 'spec_helper'

describe ContactController, "#routing" do
  it "routes to #new" do
    get('/contato').should route_to('contact#new')
  end

  it "routes to #create" do
    post('/contato').should route_to('contact#create')
  end
end