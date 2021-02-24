feature 'Sign up user', js: true do
  scenario 'User can register' do
    random = Time.now.to_i.to_s

    visit('http://testautomate.me/redmine/')
    expect(page).to have_content 'Redmine@testautomate.me'

    find('.register').click

    find('#user_login').set 'test' + random
    find('#user_password').set 'test1234'
    find('#user_password_confirmation').set 'test1234'
    find('#user_firstname').set 'Test'
    find('#user_lastname').set 'User'
    find('#user_mail').set "test#{random}@test.org"

    find('#new_user > input[type=submit]:nth-child(4)').click

    expect(page).to have_content 'Logged in as test'
  end
end