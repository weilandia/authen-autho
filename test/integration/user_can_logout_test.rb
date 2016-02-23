require 'test_helper'

class UserCanLogoutTest < FeatureTest
  test "user can logout of app" do
    login_user

    click_on "Logout"

    refute page.has_content?("Welcome, nweiland!")
  end
end
