require 'spec_helper'

describe CategoriesController, "#routing" do
  it "routes to #index" do
    get('/category').should route_to(
      'categories#index', category: 'category'
    )

    get('/category/2').should route_to(
      'categories#index', category: 'category', page: '2'
    )
  end
end