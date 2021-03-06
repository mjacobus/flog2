require 'rubygems'

require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start 'rails'

require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'paperclip/matchers'

  RSpec.configure do |config|
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.include Paperclip::Shoulda::Matchers
    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true
    config.include FactoryGirl::Syntax::Methods
  end

end

Spork.each_run do
  FactoryGirl.reload
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  ActiveSupport::Dependencies.clear
end
