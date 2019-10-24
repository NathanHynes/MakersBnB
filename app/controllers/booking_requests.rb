class MakersBnB < Sinatra::Base

  get '/booking_requests/:id/new' do
    @listing = Listing.get(params[:id])
    # p @listing
    # p @listing.date_from
    # @datefrom = date_format(@listing.date_from)
    # p @datefrom
    # @dateto = date_format(@listing.date_to)
    # p @dateto
    erb :'booking_requests/request'
  end

  get '/bookings' do
    @my_listings = Listing.all(user_id: current_user.id)
    p @my_listings
    erb :'bookings/bookings'
  end

  get '/test' do
    erb :'booking_requests/test2'
  end

  post '/bookingrequests' do
    booking = Bookingrequest.create(requested_date: params[:date], message: params[:message], listing_id: params[:listing_id], user_id: current_user.id)
    if booking.save
      listing = Listing.get(booking.listing_id)
      # p booking.listing.user
      owner = User.get(listing.user_id)
      flash[:success] = "#{current_user.username} has sent booking request to #{owner.username}"
    else
      flash[:alert] = 'unsuccessful booking'
    end
      redirect '/listings'
  end

end
