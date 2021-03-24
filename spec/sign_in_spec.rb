# frozen_string_literal: true

feature 'Sign in user', js: true do
  scenario 'User can log in' do
    visit ENV['ROOT_URL']
    expect(page).to have_content 'Redmine@testautomate.me'

    user = User.new

    api_create_user(user)

    find('.login').click

    find('#username').set user.username
    find('#password').set user.password
    find('#login-submit').click

    expect(page).to have_content "Logged in as #{user.username}"
  end
end
