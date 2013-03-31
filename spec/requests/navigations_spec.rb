require 'spec_helper'

describe "Navigations" do
  %w(
    /
  ).each do |uri|
    it "loads #{uri}" do
      get(uri)
      response.should be_success
    end
  end
end
