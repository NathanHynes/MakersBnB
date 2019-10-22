# frozen_string_literal: true

feature 'authentication' do
  scenario 'User can log in' do
    user_sign_up
    expect(current_path).to eq '/listings'
  end

  scenario 'incorrect log in attempt' do
    user_sign_up
    click_button('Sign out')
    visit '/'
    fill_in(:username_login, with: 'FalseUser')
    fill_in(:password_login, with: 'password123')
    click_button 'Log In'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Username or Password do not match database'
  end

  scenario 'a user can sign out' do
  user_sign_up
  visit '/'
  click_button('Sign out')

  expect(page).not_to have_content 'Welcome, JoeBloggs'
  expect(page).to have_content 'You have signed out.'
end
end
