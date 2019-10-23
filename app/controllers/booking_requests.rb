class MakersBnB < Sinatra::Base

  get '/booking_requests/:id/new' do
    p Listing.get(params[:id])
    @listing = Listing.get(params[:id])
    p User.get(@listing.user_id)
    erb :'booking_requests/new'
  end

  post '/bookingrequests' do
    booking = Bookingrequest.create(requested_date: params[:date], listing_id: params[:listing_id], user_id: current_user.id)
    p booking.save
    p booking
    redirect '/listings'
  end

end
