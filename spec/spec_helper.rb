require File.dirname(__FILE__) + "./../lib/active_resource_associatable/"

require 'minitest/autorun'
require 'active_resource'
require 'active_record'
require 'factory_girl'
require 'byebug'

load(File.dirname(__FILE__) + "/factories.rb")

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", 
                   :database => ":memory:")

load(File.dirname(__FILE__) + "/schema.rb")
load(File.dirname(__FILE__) + "/lib/test_classes.rb")
