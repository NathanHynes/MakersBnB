feature 'User log in' do
  scenario 'User can log in' do
    user_sign_up

    user_log_in
    expect(current_path).to eq '/listings'
  end

  scenario 'incorrect log in attempt' do
    user_sign_up

    visit '/'
    fill_in(:username_login, with: 'FalseUser')
    fill_in(:password_login, with: 'password123')
    click_button 'Log In'
    expect(current_path).to eq '/'
    expect(page).to have_content "Username or Password do not match database"
  end
end
