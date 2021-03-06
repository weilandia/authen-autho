ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
class ActiveSupport::TestCase
  fixtures :all
end

class FeatureTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def login_user
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
