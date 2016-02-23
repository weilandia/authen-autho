require 'test_helper'

class UserCanLoginTest < FeatureTest
  test "existing user can login to app" do
    user = User.create(username: "nweiland", password: "password")

    visit login_path

    fill_in "Username", with: "nweiland"
    fill_in "Password", with: "password"

    click_on "Login"

    within("#greet") do
      assert page.has_content?("Hey, #{user.username}!")
    end
  end
end
