require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/partial'
require 'dm-validations'
require 'dm-timestamps'

require_relative 'models/listing'

# require_relative all models ie 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/MakersBnB_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
