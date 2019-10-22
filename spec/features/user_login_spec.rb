feature 'User log in' do
  scenario 'User can log in' do
    visit '/'
    fill_in(:forename, with: 'Joe')
    fill_in(:surname, with: 'Bloggs')
    fill_in(:email, with: 'test@test.com')
    fill_in(:username, with: 'JoeBloggs')
    fill_in(:password, with: 'password1234')
    fill_in(:password_confirm, with: 'password1234')
    click_button 'Sign Up'

    visit '/'
    fill_in(:username_login, with: 'JoeBloggs')
    fill_in(:password_login, with: 'password1234')
    click_button 'Log In'
    expect(current_path).to eq '/listings'
  end

  scenario 'incorrect log in attempt' do
    User.create(
      :forename => 'Joe',
      :surname => 'Bloggs',
      :email => 'noddy@hotmail.com',
      :username => 'JoeBloggs',
      :password => 'password123'
    )
    visit '/'
    fill_in(:username_login, with: 'FalseUser')
    fill_in(:password_login, with: 'password123')
    click_button 'Log In'
    expect(current_path).to eq '/'
    expect(page).to have_content "Username or Password do not match database"
  end
end
