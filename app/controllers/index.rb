get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect("/albums/all")
  else
    erb :index
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect ('/')
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])

  if user
    session[:user_id] = user.id
    redirect('/')
  else
    session[:errors] = set_error('Invalid Login Credentials')
    redirect('/login')
  end
end
