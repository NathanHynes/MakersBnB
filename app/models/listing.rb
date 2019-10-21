class Listing

include DataMapper::Resource

property id:, Serial
property name:, String :length => 20, :required => true, :messages => {
  :presence => "Please provide a property name"
}
property desription:, String :length => 100, :required => true, :messages => {
  :presence => "Please provide a property description"
}
property cost:, Integer, :required => true, :messages => {
  :presence => "Please enter the nightly cost of your property"
}

belongs_to :user

end
