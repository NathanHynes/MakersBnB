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

  get '/' do
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def date_format(date)
      date.strftime("%Y/%m/%d")
    end
  end

  run! if app_file == $PROGRAM_NAME
end

# AT BOTTOM OF THIS FILE :
require_relative 'controllers/listings'
require_relative 'controllers/sessions'
require_relative 'controllers/users'
require_relative 'controllers/booking_requests'
require_relative 'controllers/mystays'
