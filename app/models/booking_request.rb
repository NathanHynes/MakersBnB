class Bookingrequest

  include DataMapper::Resource
  property :id, Serial
  property :requested_date, Date

  belongs_to :listing
  belongs_to :user
end
