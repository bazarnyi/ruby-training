# frozen_string_literal: true

module FeatureHelper
  def sign_up_user
    @sign_up_page = SignUpPage.new

    @user = User.new

    @sign_up_page.login.set @user.username
    @sign_up_page.password.set @user.password
    @sign_up_page.password_confirm.set @user.password
    @sign_up_page.firstname.set @user.firstname
    @sign_up_page.lastname.set @user.lastname
    @sign_up_page.email.set @user.email

    @sign_up_page.submit_btn.click
  end
end
