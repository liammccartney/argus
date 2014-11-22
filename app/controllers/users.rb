# ALL
get '/users/all' do
  @users = Users.all
end

#CREATE

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  new_user = User.new(params[:user])
 if new_user.save
  session[:user_id] = new_user.id
  redirect('/')
 else
  session[:error]= new_user.errors.messages
    redirect('/signup')
  end
end

# READ
get '/users/:id' do |id|
  @user = User.find(id)
  erb :'users/show'
end

# UPDATE
get '/users/:id/update' do |id|
  @user = User.find(id)
  erb :'users/update'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])
  redirect("/users/#{@user.id}")
end

# DESTROY
delete '/users/:id' do |id|
  album = Album.find(id)
  album.destroy
  redirect('/users/all')
end

