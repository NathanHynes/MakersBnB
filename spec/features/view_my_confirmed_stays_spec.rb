feature "A user can see the status of their requests to stay at a property" do
  scenario "a user books sees their confirmed booking requests" do
   view_booking_requests
    click_button 'Accept'
    user_log_out
    user2_log_in
    expect(page).to have_content 'Moe'
    click_link 'My Stays'
    expect(current_path).to eq "/mystays"
    expect(page).to have_content 'Sids bungalow'
  end
end
