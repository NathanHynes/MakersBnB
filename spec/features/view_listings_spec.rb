feature "Listings page" do

  scenario "Visting listings page and viewing listings" do
    user_sign_up
    create_listing
    expect(page).to have_content "Sids bungalow"
    expect(page).to have_content "Sid loves his bungalow"
    expect(page).to have_content "500"
  end

  scenario "Visting listings page and viewing mulitple listings" do
    user_sign_up
    create_listing
    create_listing_two
    expect(page).to have_content "Sids bungalow"
    expect(page).to have_content "Sid loves his bungalow"
    expect(page).to have_content "500"
    expect(page).to have_content "Steves bungalow"
    expect(page).to have_content "Steve loves his bungalow"
    expect(page).to have_content "2000"
  end

end
