
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
      user_id: current_user.id
    )

    redirect '/listings'
  end

  post "/test" do

    #Create new Image Model
    img = Image.new
    p img

    #Save the data from the request
     img.image = params[:image] #carrierwave will upload the file automatically

    #Save
    p img.save
    redirect '/test'

  end

  # get '/test' do 
  #   image = Image.last
  #   p image
  #   # erb :test
  # end 

end
