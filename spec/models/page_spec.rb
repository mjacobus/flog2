require 'spec_helper'

describe Page do
  describe "#body" do
    it { should allow_mass_assignment_of(:body) }
    it { should validate_presence_of(:title) }
  end

  describe "#slug" do
    it { should allow_mass_assignment_of(:slug) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug).case_insensitive }
  end

  describe "#title" do
    it { should allow_mass_assignment_of(:title) }
    it { should validate_presence_of(:title) }
  end
end
