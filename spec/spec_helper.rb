require File.dirname(__FILE__) + "./../lib/active_resource_associatable/"

require 'mocha'
require 'mocha/test_unit'
require 'minitest/autorun'
require 'active_resource'
require 'active_record'
require 'factory_girl'

load("factories.rb")

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
                   :database => ":memory:")

load("schema.rb")

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
