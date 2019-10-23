feature "Adding a new listing" do

  scenario "Add a new listing and view it in on the listings page" do
    user_sign_up
    create_listing

    expect(current_path).to eq "/listings"
    expect(page).to have_content "Sids bungalow"
    expect(page).to have_content "Sid loves his bungalow"
    expect(page).to have_content "500"
    expect(page).to have_content "2019-12-01"
    expect(page).to have_content "2019-12-30"
  end


end

# listing_one = Listing.create(:name =>'Nabilles house', :description => "Nabilles big house", :cost => 2000, :user_id => user.id )
