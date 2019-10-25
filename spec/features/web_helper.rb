# frozen_string_literal: true

def user_sign_up
  visit '/'
  fill_in(:forename, with: 'Joe')
  fill_in(:surname, with: 'Bloggs')
  fill_in(:email, with: 'test@test.com')
  fill_in(:username, with: 'JoeBloggs')
  fill_in(:password, with: 'password1234')
  fill_in(:password_confirmation, with: 'password1234')
  click_button 'Sign Up'
end

def user_sign_up_two
  visit '/'
  fill_in(:forename, with: 'Steve')
  fill_in(:surname, with: 'Jobbs')
  fill_in(:email, with: 'test@test.com')
  fill_in(:username, with: 'JoeBloggs')
  fill_in(:password, with: 'password1234')
  fill_in(:password_confirmation, with: 'password1234')
  click_button 'Sign Up'
end

def user_log_in
  visit '/'
  fill_in(:username_login, with: 'JoeBloggs')
  fill_in(:password_login, with: 'password1234')
  click_button 'Log In'
end

def user2_log_in
  visit '/'
  fill_in(:username_login, with: 'Moe')
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
  fill_in(:password_confirmation, with: 'password1234')
  click_button 'Sign Up'
end

def user3_sign_up
  visit '/'
  fill_in(:forename, with: 'Tom')
  fill_in(:surname, with: 'Jones')
  fill_in(:email, with: 'Jones@test.com')
  fill_in(:username, with: 'tomjones')
  fill_in(:password, with: 'password1234')
  fill_in(:password_confirmation, with: 'password1234')
  click_button 'Sign Up'
end

def user_log_out
  visit '/'
  click_button 'Sign out'
end

def create_listing
  visit "/listings"
  click_button 'New Listing'
  fill_in('name', with: "Sids bungalow")
  fill_in('description', with: "Sid loves his bungalow")
  fill_in('cost', with: "500")
  fill_in('date_from', with: "2019-12-01")
  fill_in('date_to', with: "2019-12-30")
  click_button "Submit"
end

def create_listing_two
  visit "/listings"
  click_button 'New Listing'
  fill_in('name', with: "Steves bungalow")
  fill_in('description', with: "Steve loves his bungalow")
  fill_in('cost', with: "2000")
  fill_in('date_from', with: "2019-12-01")
  fill_in('date_to', with: "2019-12-30")
  click_button "Submit"
end

def view_booking_requests
  user_sign_up
  create_listing
  user_log_out
  expect(page).to have_content 'You have signed out.'
  user2_sign_up
  create_listing_two
  first('.listings').click_link 'booking-link'
  fill_in :date, with: '2019-10-24'
  click_button 'Submit'
  user_log_out
  user_log_in
  click_link "Bookings"
end

def multiple_requests
  user_sign_up
  create_listing
  user_log_out
  user2_sign_up
  first('.listings').click_link 'booking-link'
  fill_in :date, with: '2019-10-24'
  click_button 'Submit'
  user_log_out
  user3_sign_up
  first('.listings').click_link 'booking-link'
  fill_in :date, with: '2019-10-24'
  click_button 'Submit'
  user_log_out
end
