require_relative '../test_helper'

class UserEditsRobotTest < FeatureTest

  def create_robot(options={})
    options[:name]  ||= "Robot"
    options[:city]  ||= "Robot City"
    options[:state] ||= "Robot State"
    options[:avatar] ||= "Robot_One"
    options[:birthdate] ||= "205462"
    options[:datehired] ||= "123557"
    options[:department] ||= "Cleaner"

    visit '/'
    click_link("Create New Robot")
    fill_in("robot[name]", with: options[:name])
    fill_in("robot[city]", with: options[:city])
    fill_in("robot[state]", with: options[:state])
    fill_in("robot[avatar]", with: options[:avatar])
    fill_in("robot[birthdate]", with: options[:birthdate])
    fill_in("robot[datehired]", with: options[:datehired])
    fill_in("robot[department]", with: options[:department])
    click_link_or_button("Submit")
  end

  def test_user_can_edit_robot
    create_robot
    visit '/robots'
    click_link("Edit Order")
    fill_in("robot[name]", with: "Wall-E")
    fill_in("robot[city]", with: "Byte-on")
    fill_in("robot[state]", with: "Roborado")
    fill_in("robot[avatar]", with: "Robo2000")
    fill_in("robot[birthdate]", with: "124567")
    fill_in("robot[datehired]", with: "342367")
    fill_in("robot[department]", with: "Robotics")
    click_button("Edit Order")
    assert page.has_content?("Wall-E")
  end
end