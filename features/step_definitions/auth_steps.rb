# frozen_string_literal: true

Given('I visit Redmine homepage') do
  @home_page = HomePage.new
  @home_page.load
end

Given('I have preregistered user') do
  @user = User.new
  api_create_user(@user)
end

When(/^I click click '([^"]*)' button$/) do |button|
  if button == 'login'
    find('.login').click
  else
    @home_page.menu.sign_up_link.click
  end
end

When('I fill in login form') do
  find('#username').set @user.username
  find('#password').set @user.password
  find('#login-submit').click
end

When('I fill in registration form') do
  @user = User.new
  sign_up_user(@user)
end

Then('I see that I become logged in user') do
  expect(@home_page.menu.logged_as.text).to include "Logged in as #{@user.username}"
end
