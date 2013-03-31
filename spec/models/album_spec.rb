require 'spec_helper'

describe Album, '#body' do
  it { should allow_mass_assignment_of(:body) }
  it { should_not validate_presence_of(:body) }
end

describe Album, '#category' do
  it { should belong_to(:category) }
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
