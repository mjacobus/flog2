require 'spec_helper'

describe Picture, "#description" do
  it { should allow_mass_assignment_of(:description) }
  it { should_not validate_presence_of(:description) }
end

describe Picture, "#file" do
  it { should allow_mass_assignment_of(:file) }
  it { should have_attached_file(:file) }
  it { should validate_attachment_presence(:file) }
  it { should validate_attachment_content_type(:file).
                allowing('image/png','image/jpeg').
                rejecting('text/plain', 'text/xml', 'image/gif') }
  it { should validate_attachment_size(:file).less_than(10.megabytes) }
end

describe Picture, "#title" do
  it { should allow_mass_assignment_of(:title) }
  it { should validate_presence_of(:title) }
end