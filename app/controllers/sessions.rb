class MakersBnB < Sinatra::Base

  post '/sessions' do
    user = User.authenticate(username: params[:username_login], password: params[:password_login])
    p user
    if user
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash[:alert] = 'Username or Password do not match database'
      redirect '/'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:success] = 'You have signed out.'
    redirect'/'
  end
end
