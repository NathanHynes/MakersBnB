require 'bcrypt'

class User 
  include DataMapper::Resource

  attr_accessor :password

  property :id, Serial
  property :forename, String, :length => 40, :required => true,
  :messages => {
      :presence => "Please provide a first name",
    }
  property :surname, String, :length => 40, :required => true,
  :messages => {
      :presence => "Please provide a surname name",
    }
  property :email, String, :required => true, :unique => true, :format => :email_address,
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
  property :crypted_pass, String, :length => 60..60, :required => true, :writer => :protected

  has n, :listings

  def password=(password)
    @password = password
    self.crypted_pass = BCrypt::Password.create(password)
  end

end 