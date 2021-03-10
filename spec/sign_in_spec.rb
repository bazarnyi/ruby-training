# frozen_string_literal: true

feature 'Sign in user', js: true do
  scenario 'User can log in' do
    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.login').click

    find('#username').set 'test'
    find('#password').set 'test1234'
    find('#login-submit').click

    expect(page).to have_content 'Logged in as test'
  end
end
