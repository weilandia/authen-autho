require 'test_helper'

class UserRegistersForAccountTest < FeatureTest
  test "user can register for app" do
    visit '/'
    click_on "Signup"

    fill_in "Username", with: "nweiland"
    fill_in "Password", with: "password"

    click_on "Signup"

    user = User.last
    assert_equal "/users/#{user.id}", current_path

    within("#greet") do
      assert page.has_content?("Hey, nweiland!")
    end
  end
end
