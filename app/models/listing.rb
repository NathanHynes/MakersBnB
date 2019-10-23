class Listing

include DataMapper::Resource

property :id, Serial
property :name, String, :length => 20, :required => true, :messages => {
  :presence => "Please provide a property name"
}
property :description, String, :length => 100, :required => true, :messages => {
  :presence => "Please provide a property description"
}
property :cost, Integer, :required => true, :messages => {
  :presence => "Please enter the nightly cost of your property"
}
property :date_from, Date, :required => true, :messages => {
 :presence => "Please enter a starting date for your listing"
}
property :date_to, Date, :required => true, :messages => {
 :presence => "Please enter an end date for your listing"
}

belongs_to :user
has n, :bookingrequests

end
