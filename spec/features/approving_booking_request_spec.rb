feature "A user can accept or decline a booking request from another user" do
  scenario "a user books a listing. the owner approves that booking" do
   view_booking_requests
    click_button 'Accept'
    expect(current_path).to eq "/bookings"
    expect(page).not_to have_content "Szyslak"
  end

  scenario "a user books a listing. the owner declines that booking" do
    view_booking_requests
     click_button 'Reject'
     expect(current_path).to eq "/bookings"
     expect(page).not_to have_content "Szyslak"
   end

  scenario "a user cant' accept two requests for the same date" do
    multiple_requests
    user_log_in
    click_link "Bookings"
    expect(current_path).to eq "/bookings"
    first('.approve').click_button 'Accept'
    expect(page).not_to have_content "Szyslak"
    expect(page).to have_content "Tom Jones"
    first('.approve').click_button 'Accept'
    expect(page).to have_content "Tom Jones"
   end
end
