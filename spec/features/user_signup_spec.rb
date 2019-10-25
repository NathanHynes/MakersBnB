# frozen_string_literal: true

feature 'User can sign up' do
  scenario 'User can sign up' do
    user_sign_up
    expect(page).to have_content 'Welcome JoeBloggs'
    expect(current_path).to eq '/listings'
  end
end
