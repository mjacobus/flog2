require 'spec_helper'

describe AlbumsController do
  let(:album)    { FactoryGirl.build(:album) }

  describe "#index" do
    it "assigns public and published albums to @albums" do
      query = stub(:query)
      controller.stub(:per_page).and_return('6')
      Album.should_receive(:published).and_return(query)
      query.should_receive(:public).and_return(query)
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

    context 'when album is secret' do
      let(:album) { create(:album, secret: true, token: 'token') }

      it 'shows album if token is correct' do
        get :show, album: album.slug, category: album.category.slug , token: 'token'
        expect(response).to be_success
      end

      it 'raises error if token does not match' do
        expect do
          get :show, album: album.slug, category: album.category.slug, token: 'error'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end
