require 'spec_helper'

describe Category, "#description" do
  it { should allow_mass_assignment_of(:description) }
  it { should_not validate_presence_of(:description) }
end

describe Category, "#name" do
  it { should allow_mass_assignment_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end

describe Category, "#slug" do
  it { should allow_mass_assignment_of(:slug) }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug).case_insensitive }
end