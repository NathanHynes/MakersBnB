class Approvedrequest

  include DataMapper::Resource
  property :id, Serial
  property :date_of_stay, Date, :unique => true,
  :messages => {
    :is_unique => "date already booked",
  }

  belongs_to :listing
  belongs_to :user
end
