
class MakersBnB < Sinatra::Base

  get '/listings' do
    @listings = Listing.all
    erb :'listings/listings'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    listing = Listing.create(
      name: params[:name],
      description: params[:description],
      cost: params[:cost],
      date_from: params[:date_from],
      date_to: params[:date_to],
      user_id: current_user.id,
      image: params[:image]
    )
    img = Image.new

    #Save the data from the request
     img.image = params[:image] #carrierwave will upload the file automatically

    #Save
     img.save
    redirect '/listings'
  end
end
