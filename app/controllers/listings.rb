
class MakersBnB < Sinatra::Base

  get '/listings' do
    @listings = Listing.all
    @user = session[:user_id].nil?
    erb :'listings/listings'
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    Listing.create(
      name: params[:name],
      description: params[:description],
      cost: params[:cost],
      date_from: params[:date_from],
      date_to: params[:date_to],
      user_id: current_user.id
    )
    redirect '/listings'
  end

end
