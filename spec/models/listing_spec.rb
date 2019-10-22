require './app/models/listing'

describe Listing do

    it "creates a listing" do
      listing = Listing.create(:name =>'Nabilles house', :description => "this is a test", :cost => 1000 )
      expect(listing.cost).to eq 1000
      expect(listing.description).to eq "this is a test"
      expect(listing.name).to eq "Nabilles house"
    end

end
