# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores


  get '/test' do
    erb  :'index'
  end

  run! if app_file == $PROGRAM_NAME
end

# AT BOTTOM OF THIS FILE :
# require_relative all controllers
# ie controllers/users
