# frozen_string_literal: true

class MakersBnB < Sinatra::Base
  post '/users' do
    user = User.create(
      forename: params[:forename],
      surname: params[:surname],
      email: params[:email],
      username: params[:username],
      password: params[:password],
    )
    if user.save
      session[:user_id] = user.id
    else
      flash[:notice] = user.errors.full_messages  
    end
    redirect '/listings'
  end
end
