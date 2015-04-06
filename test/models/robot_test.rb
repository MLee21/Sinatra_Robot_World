require_relative '../test_helper'

class RobotTest < MiniTest::Test

  def test_it_can_assign_attributes
    robot = Robot.new({
      :id => 1,
      :name => "Joe",
      :city => "Tac",
      :state => "Xof",
      :avatar => "Vishnu",
      :birthdate => "12-56-2678",
      :datehired => "12-89-2678",
      :department => "liquor distribution"
      })
    assert_equal 1, robot.id
    assert_equal "Joe", robot.name
    assert_equal "Tac", robot.city
    assert_equal "Xof", robot.state
    assert_equal "Vishnu",robot.avatar
    assert_equal "12-56-2678", robot.birthdate
    assert_equal "12-89-2678", robot.datehired
    assert_equal "liquor distribution", robot.department
  end  
end