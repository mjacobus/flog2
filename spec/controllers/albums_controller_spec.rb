require 'spec_helper'

describe AlbumsController do
  let(:album)    { FactoryGirl.build(:album) }

  describe "#index" do
    it "assigns to @album" do
      query = stub(:query)
      controller.stub(:per_page).and_return('6')
      Album.should_receive(:published).and_return(query)
      query.should_receive(:filter).with('foo' => 'bar').and_return(query)
      query.should_receive(:page).with('2').and_return(query)
      query.should_receive(:per).with('6').and_return([album])
      
      Album.stub(:published).and_return(query)
      get :index, foo: :bar, page: 2

      assigns(:albums).should eq([album])
      response.should be_success
    end
  end

  describe "show" do
    it "assigns to @album" do
      params = {'category' => 'category', 'album' => 'album'}
      query = stub(:query)
      Album.should_receive(:published).and_return(query)
      query.should_receive(:find_one_by).with(params).and_return(album)
      get :show, category: 'category', album: 'album'
      response.should be_success
      assigns(:album).should eq(album)
    end
  end

end
