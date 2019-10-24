feature "Viewing booking requests" do

  scenario "See bookings made on the landlord bookings page" do
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
    expect(current_path).to eq "/bookings"
    expect(page).to have_content "Sids bungalow"
  end

  scenario "See all requests of per each of owners listing" do
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
  end


end
