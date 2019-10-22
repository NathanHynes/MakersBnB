feature 'User can sign up' do
  scenario 'User can sign up' do
    visit '/'
    fill_in(:forename, with: 'Joe')
    fill_in(:surname, with: 'Bloggs')
    fill_in(:email, with: 'test@test.com')
    fill_in(:username, with: 'JoeBloggs')
    fill_in(:password, with: 'password1234')
    fill_in(:password_confirm, with: 'password1234')
    # expect(page).to have_content 'Welcome JoeBloggs'
    click_button 'Sign Up'
    expect(current_path).to eq '/listings'
  end
end
