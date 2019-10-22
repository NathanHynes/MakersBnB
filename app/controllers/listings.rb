class MakersBnB < Sinatra::Base

  get '/listings' do
    @listings = Listing.all
    erb :'listings/listings'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/create' do
   newlisting = Listing.create(name: params[:name], description: params[:description], cost: params[:cost], user_id: 1 )
   redirect '/listings'
  end

end
