feature 'booking request' do
  scenario 'user requests a listing' do
    user_sign_up
    create_listing
    user_log_out
    expect(page).to have_content 'You have signed out.'
    user2_sign_up
    click_link 'booking-link'
    fill_in :message, with: 'Please can I stay here'
    fill_in :date, with: '2019-10-24'
    click_button 'Submit'
    expect(page).to have_content 'Moe has sent booking request to JoeBloggs'
  end
end
