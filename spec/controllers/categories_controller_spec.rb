require 'spec_helper'

describe CategoriesController do
  let(:category) { FactoryGirl.build(:category) }
  let(:albums)   { [FactoryGirl.build(:album)] }

  describe "GET 'index'" do
    it "returns http success" do
      params = { category: 'category' }
      Category.should_receive(:find_by_slug).with('category').and_return(category)
      category.stub_chain(:albums, :published, :page, :per).and_return(albums)

      get :index, params
      response.should be_success
      assigns(:albums).should eq(albums)
      assigns(:category).should eq(category)
    end
  end

end
