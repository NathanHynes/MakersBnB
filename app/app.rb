# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'json'
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

    def get_listing(id)
      @test = Listing.get(id)
    end

    def get_booked_dates(listing)
      arr = []
      listing.Approvedrequests.each do |date|
        arr << date_format(date.date_of_stay)
      end
      return arr
    end

    def date_available(date)
      approved = Approvedrequest.first(:date_of_stay => date)
      approved.nil?
    end

    def save_booking(booking)
        listing = Listing.get(booking.listing_id)
        # p booking.listing.user
        owner = User.get(listing.user_id)
        flash[:success] = "#{current_user.username} has sent booking request to #{owner.username}"
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
