feature "A user can accept a booking request from another user" do
  scenario "a user books a listing. the owner approves that booking" do
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
    expect(page).to have_content "Moe Szyslak"
    expect(page).to have_button "Accept"
    expect(page).to have_button "Reject"
    click_button 'Accept'
    expect(current_path).to eq "/bookings"
    expect(page).not_to have_content "Szyslak"
  end
end
