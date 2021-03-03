feature 'Sign up user', js: true do
  scenario 'User can register' do
    @home_page = HomePage.new

    @home_page.load
    expect(@home_page.header.text).to include 'Redmine@testautomate.me'

    @home_page.menu.sign_up_link.click

    @sign_up_page = SignUpPage.new
    random = SecureRandom.hex

    @sign_up_page.login.set 'test' + random
    @sign_up_page.password.set 'test1234'
    @sign_up_page.password_confirm.set 'test1234'
    @sign_up_page.firstname.set 'Test'
    @sign_up_page.lastname.set 'User'
    @sign_up_page.email.set "test#{random}@test.org"

    @sign_up_page.submit_btn.click

    expect(@home_page.menu.logged_as.text).to include 'Logged in as test'
  end
end