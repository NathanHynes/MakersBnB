class MakersBnB < Sinatra::Base 

  get '/mystays' do 
    @approved = Approvedrequest.all(user_id: current_user.id)
    p @approved
    erb :'bookings/mystays'
  end

end