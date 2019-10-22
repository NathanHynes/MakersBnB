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

  post '/sessions' do
    user = User.authenticate(username: params[:username_login], password: params[:password_login])
    p user
    if user
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash[:alert] = 'Username or Password do not match database'
      redirect '/'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:success] = 'You have signed out.'
    redirect'/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end

# AT BOTTOM OF THIS FILE :
# require_relative all controllers
# ie controllers/users
require_relative 'controllers/users'
