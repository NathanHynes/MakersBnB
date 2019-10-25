# frozen_string_literal: true

class MakersBnB < Sinatra::Base
  post '/users' do
    user = User.create(
      forename: params[:forename],
      surname: params[:surname],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash[:notice] = user.errors.full_messages
      redirect '/'
    end
  end
end
