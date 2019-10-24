class MakersBnB < Sinatra::Base 

  get '/mystays' do 
    @approved = Approvedrequest.all(user_id: current_user.id)
    erb :'bookings/mystays'
  end

end