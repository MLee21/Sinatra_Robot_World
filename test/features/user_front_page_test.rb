require_relative '../test_helper'

class FrontPageTest < FeatureTest

  def test_user_sees_welcome_message
    visit '/'
    assert page.has_content?("Welcome to Robot World!")
  end
end