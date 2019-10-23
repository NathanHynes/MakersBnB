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

def user2_sign_up
  visit '/'
  fill_in(:forename, with: 'Moe')
  fill_in(:surname, with: 'Szyslak')
  fill_in(:email, with: 'moe@test.com')
  fill_in(:username, with: 'Moe')
  fill_in(:password, with: 'password1234')
  fill_in(:password_confirm, with: 'password1234')
  click_button 'Sign Up'
end

def user_log_out
  visit '/'
  click_button 'Sign out'
end

def create_listing
  visit "/listings"
  click_button 'create new listing'
  fill_in('name', with: "Sids bungalow")
  fill_in('description', with: "Sid loves his bungalow")
  fill_in('cost', with: "500")
  click_button "Submit"
end
