class MakersBnB < Sinatra::Base

  get '/booking_requests/:id/new' do
    p Listing.get(params[:id])
    @listing = Listing.get(params[:id])
    erb :'booking_requests/new'
  end



end
