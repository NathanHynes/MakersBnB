feature "Listings page" do

  scenario "Visting listings page and viewing listings" do
    user = User.create(
      :forename => 'Joe',
      :surname => 'Bloggs',
      :email => 'noddy@hotmail.com',
      :username => 'JoeBloggs',
      :password => 'password123'
    )
    listing_one = Listing.create(:name =>'Nabilles house', :description => "Nabilles big house", :cost => 2000,
    :date_from => '2019-12-01', :date_to => '2019-12-30', :user_id => user.id )
    visit '/listings'
    p listing_one
    expect(page).to have_content "Nabilles house"
    expect(page).to have_content "Nabilles big house"
    expect(page).to have_content "2000"
  end

  scenario "Visting listings page and viewing mulitple listings" do
    user = User.create(
      :forename => 'Joe',
      :surname => 'Bloggs',
      :email => 'noddy@hotmail.com',
      :username => 'JoeBloggs',
      :password => 'password123'
    )
    listing_one = Listing.create(:name =>'Nabilles house', :description => "Nabilles big house", :cost => 2000, :user_id => user.id, :date_from => '2019-12-01', :date_to => '2019-12-30' )
    listing_two = Listing.create(:name =>'Joshs house', :description => "Joshs tiny house", :cost => 250, :date_from => '2019-12-01', :date_to => '2019-12-30', :user_id => user.id )
    visit '/listings'
    expect(page).to have_content "Nabilles house"
    expect(page).to have_content "Nabilles big house"
    expect(page).to have_content "2000"
    expect(page).to have_content "Joshs house"
    expect(page).to have_content "Joshs tiny house"
    expect(page).to have_content "250"
  end

end
