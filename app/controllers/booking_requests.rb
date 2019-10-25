require './app/models/send_confirm'

class MakersBnB < Sinatra::Base
  enable :method_override

  get '/booking_requests/:id/new' do
    @listing = Listing.get(params[:id])
    p @listing
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
      booking = Bookingrequest.create(requested_date: params[:date], message: params[:message], listing_id: params[:listing_id], user_id: current_user.id)
      if booking.save
        save_booking(booking)
      end
    else
      flash[:alert] = 'unsuccessful booking, listing already booked'
    end
    redirect '/listings'
  end

  post '/bookings' do
    approved = Approvedrequest.create(date_of_stay: params[:requested_date], listing_id: params[:listing_id], user_id: params[:user_id])
    email_confirm = SendConfirm.new
    if approved.save
      Bookingrequest.get(params[:request_id]).destroy
      email_confirm.send_approval_email(guest_name: approved.user.forename, guest_email: approved.user.email, listing_name: approved.listing.name, date: approved.date_of_stay)
    else
      flash[:notice] = approved.errors.full_messages
    end
    redirect '/bookings'
  end

  delete '/bookings/:id' do
    rejected_booking = Bookingrequest.get(params[:id])
    email_decline = SendConfirm.new
    email_decline.send_declined_email(guest_name: rejected_booking.user.forename, guest_email: rejected_booking.user.email, listing_name: rejected_booking.listing.name, date: rejected_booking.requested_date)
    rejected_booking.destroy
    redirect '/bookings'

  end

end
