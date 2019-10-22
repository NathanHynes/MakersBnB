# frozen_string_literal: true

def user_sign_up
  visit '/'
  fill_in(:forename, with: 'Joe')
  fill_in(:surname, with: 'Bloggs')
  fill_in(:email, with: 'test@test.com')
  fill_in(:username, with: 'JoeBloggs')
  fill_in(:password, with: 'password1234')
  fill_in(:password_confirm, with: 'password1234')
  click_button 'Sign Up'
end

def user_log_in
  visit '/'
  fill_in(:username_login, with: 'JoeBloggs')
  fill_in(:password_login, with: 'password1234')
  click_button 'Log In'
end
