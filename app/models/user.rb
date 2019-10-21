class User 
  include DataMapper::Resource

  property :id, Serial
  property :forename, String, :length => 40, :required => true
  :messages => {
      :presence => "Please provide a first name",
    }
  property :surname, String, :length => 40, required => true
  :messages => {
      :presence => "Please provide a surname name",
    }
  property :email, String, :required => true, :unique => true, :format => :email_address
    :messages => {
      :presence => "Please provide e-mail address",
      :is_unique => "E-mail address already used",
      :format => "invalid e-mail address"
    }
  property :username, String, :required => true, :unique => true,
  :messages => {
    :presence => "Please provide username",
    :is_unique => "Username already used",
  }
end 