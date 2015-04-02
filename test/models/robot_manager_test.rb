require_relative '../test_helper'

class RobotManagerTest < MiniTest::Test

  def create_robots(number)
    number.times do |x|
      RobotManager.create({id: "ID:#{x}",
             name: "Name:#{x}",
             city: "City:#{x}",
           state: "State:#{x}",
         avatar: "Avatar:#{x}",
   birthdate: "Birthdate:#{x}",
   datehired: "Datehired:#{x}",
  department: "Department:#{x}"
      })
    end
  end

  def test_it_can_create_a_robot
    create_robots(1)
    robot = RobotManager.find(1)
    assert_equal 1, robot.id
    assert_equal "Name:0", robot.name
    assert_equal "City:0", robot.city
    assert_equal "State:0", robot.state
    assert_equal "Avatar:0", robot.avatar 
    assert_equal "Birthdate:0",robot.birthdate
    assert_equal "Datehired:0", robot.datehired
    assert_equal "Department:0", robot.department
  end

  def test_it_can_return_all_robots
    create_robots(4)
    robot =RobotManager.all
    assert_equal 4, robot.count
  end

  def test_it_can_find_a_specific_robot
    create_robots(3)
    robots = RobotManager.all
    assert_equal 3, robots.count

    robot = RobotManager.find(1)
    assert_equal 1, robot.id
    assert_equal "Name:0", robot.name
  end

  def test_it_can_change_the_robot
    create_robots(1)
    robot = RobotManager.find(1)
    assert_equal "Name:0",robot.name
    assert_equal "City:0", robot.city
    assert_equal 1, robot.id 

    new_robot = {name: "Robby", city: "Commerce City"}
    RobotManager.update(1, new_robot)
    updated_robot = RobotManager.find(1)
    assert_equal "Robby", updated_robot.name
    assert_equal "Commerce City", updated_robot.city
  end

  def test_it_can_delete_a_robot
    create_robots(3)
    robot = RobotManager.find(2)
    assert_equal "Name:1", robot.name 
    assert_equal 2, robot.id 
    original = RobotManager.all 
    assert_equal 3, original.count

    RobotManager.delete(2)
    robots = RobotManager.all 
    assert_equal 2, robots.count
  end
end