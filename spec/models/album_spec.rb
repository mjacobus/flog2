require 'spec_helper'

describe Album, '#body' do
  it { should allow_mass_assignment_of(:body) }
  it { should_not validate_presence_of(:body) }
end

describe Album, '#category' do
  it { should belong_to(:category) }
  it { should allow_mass_assignment_of(:category_id) }
end

describe Album, '#slug' do
  it { should allow_mass_assignment_of(:slug) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug).case_insensitive }
end

describe Album, '#title' do
  it { should allow_mass_assignment_of(:title) }
  it { should validate_presence_of(:title) }
end

describe Album, '#pictures' do
  it { should have_many(:pictures) }
end

describe Album, '.filter' do
  context "by slug" do
    let!(:expected){ [FactoryGirl.create(:album, slug: 'slug')] }
    let!(:unexpected){ [FactoryGirl.create(:album, slug: 'slug2')] }

    it "finds records by slug" do
      Album.filter(album: 'slug').should eq(expected)
    end
  end

  context "by slug" do
    let(:category) { FactoryGirl.create(:category, slug: 'category') }
    let!(:expected){ [FactoryGirl.create(:album, category: category)] }
    let!(:unexpected){ [FactoryGirl.create(:album, slug: 'slug2')] }

    it "finds records by slug" do
      Album.filter(category: 'category').should eq(expected)
    end
  end
end

describe Album, '.find_one_by' do
  context "by slug" do
    let(:expected){ FactoryGirl.build(:album) }

    context "when a record matches the criteria" do
      it "returns the record" do
        params = { album: 'slug' }
        Album.filter.should_receive(:filter).with(params).and_return(stub(limit: [expected]))
        Album.find_one_by(params).should eq(expected)
      end
    end

    context "when does not match the criterea" do
      it "raises an error" do
        expect {
          Album.find_one_by(album: 'no maching album')
        }.to raise_error(ActiveRecord::RecordNotFound, 'No record matches the given criteria')
      end
    end
  end
end
