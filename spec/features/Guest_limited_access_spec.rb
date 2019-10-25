feature 'User only features access hidden from Guest' do
  scenario 'User cannot see booking and my stays in header' do
    visit '/'
    expect(page).to have_link "Homepage"
    expect(page).not_to have_link "Bookings"
    expect(page).not_to have_link "My Stays"
    user_sign_up
    expect(page).to have_link "Bookings"
    expect(page).to have_link "My Stays"
  end
  scenario 'Guest cannot see booking request submit button' do
    user_sign_up
    create_listing
    user_log_out
    first('.guest').click_link 'Continue as Guest'
    expect(current_path).to eq "/listings"
    first('.listings').click_link 'booking-link'
    expect(page).to have_content "Please Sign in to book."
  end
end
