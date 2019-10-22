feature "Adding a new listing" do

  scenario "Add a new listing and view it in on the listings page" do
    user_sign_up
    visit "/listings"
    click_button 'New Listing'
    expect(current_path).to eq "/listings/new"
    fill_in('name', with: "Sids bungalow")
    fill_in('description', with: "Sid loves his bungalow")
    fill_in('cost', with: "500")
    fill_in('date_from', with: "2019-12-01")
    fill_in('date_to', with: "2019-12-30")
    click_button "Submit"
    expect(current_path).to eq "/listings"
    expect(page).to have_content "Sids bungalow"
    expect(page).to have_content "Sid loves his bungalow"
    expect(page).to have_content "500"
    expect(page).to have_content "2019-12-01"
    expect(page).to have_content "2019-12-30"
  end


end

# listing_one = Listing.create(:name =>'Nabilles house', :description => "Nabilles big house", :cost => 2000, :user_id => user.id )
