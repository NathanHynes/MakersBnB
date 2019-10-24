class MakersBnB < Sinatra::Base
  enable :method_override

  get '/booking_requests/:id/new' do
    @listing = Listing.get(params[:id])
    erb :'booking_requests/request'
  end

  get '/bookings' do
    @my_listings = Listing.all(user_id: current_user.id)
    erb :'bookings/bookings'
  end

  get '/listings/:id' do
    listing = Listing.get(params[:id])
    booked_dates = get_booked_dates(listing)
    { 'dateFrom': listing.date_from, 'dateTo': listing.date_to, 'bookedDates': booked_dates  }.to_json
  end

  post '/bookingrequests' do
    if date_available(params[:date]) == true
      Bookingrequest.create(requested_date: params[:date], message: params[:message], listing_id: params[:listing_id], user_id: current_user.id)
      flash[:success] = 'Yay'
      # if booking.save
      #   save_booking(booking)
      # end
      # if booking.save
      #   listing = Listing.get(booking.listing_id)
      #   # p booking.listing.user
      #   owner = User.get(listing.user_id)
      #   flash[:success] = "#{current_user.username} has sent booking request to #{owner.username}"
      # else
      #   flash[:alert] = 'unsuccessful booking'
      # end
    else
      flash[:alert] = 'unsuccessful booking'
    end
    redirect '/listings'
  end

  post '/bookings' do
    approved = Approvedrequest.create(date_of_stay: params[:requested_date], listing_id: params[:listing_id], user_id: params[:user_id])
    if approved.save
      Bookingrequest.get(params[:request_id]).destroy
    else
      flash[:notice] = approved.errors.full_messages
    end

    redirect '/bookings'
  end

  delete '/bookings/:id' do
    Bookingrequest.get(params[:id]).destroy
    redirect '/bookings'

  end

end
