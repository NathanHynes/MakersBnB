feature 'booking request' do
  scenario 'user request a listing' do
    user_sign_up
    create_listing
    user_log_out
    user2_sign_up
    click_button 'Request'
    fill_in :date, with: 24/10/2019
    click_button 'Submit'
    expect(page).to have_content 'Moe has sent booking request to JoeBloggs'
  end
end
