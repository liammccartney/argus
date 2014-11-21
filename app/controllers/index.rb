get '/' do
  # Look in app/views/index.erb
  if session[:user_id]
    redirect("/users/#{session[:user_id]}")
  else
    erb :index
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.new(params[:user])
  new_user.save
  session[:user_id] = new_user.id
  redirect('/')
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
