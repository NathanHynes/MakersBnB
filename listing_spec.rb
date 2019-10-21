require './app/models/listing.rb'

describe Listing do

    it "creates a listing" do
      listing = Listing.create(name: 'Nabilles house', cost: 1000, description: "this is a test" )
      expect(listing.cost).to eq 1000
      expect(listing.first).to be_a Listing
      expect(listing.description).to eq "this is a test"
      expect(listings.name).to eq "Nabilles house"
    end
    
end
