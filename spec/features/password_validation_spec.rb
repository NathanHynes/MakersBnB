feature 'password is validated on sign up' do
  scenario 'User enters a password incorrectly' do
    visit '/'
    fill_in(:forename, with: 'Barney')
    fill_in(:surname, with: 'Gumble')
    fill_in(:email, with: 'PlowKing@moes.com')
    fill_in(:username, with: 'Plow-King')
    fill_in(:password, with: 'Password1234')
    fill_in(:password_confirmation, with: 'Duffbeer1234')
    click_button 'Sign Up'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
