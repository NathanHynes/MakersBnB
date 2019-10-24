class Bookingrequest

  include DataMapper::Resource
  property :id, Serial
  property :message, String, :length => 140
  property :requested_date, Date
  
  belongs_to :listing
  belongs_to :user
end
