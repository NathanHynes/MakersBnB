class Approvedrequest

  include DataMapper::Resource
  property :id, Serial
  property :date_of_stay, Date

  belongs_to :listing
  belongs_to :user
end
