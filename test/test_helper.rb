ENV['ROBOT_MANAGER_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'

class Minitest::Test 
  
  def teardown
    RobotManager.delete_all
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < MiniTest::Test
  include Capybara::DSL
end