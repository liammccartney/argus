# ALL
get '/users/all' do
  @users = Users.all
end

# READ
get '/users/:id' do |id|
  @user = User.find(id)
  erb :'users/show'
end

# UPDATE--will complete after MVP is created

get '/users/:id/edit' do

end

put '/users/:id' do

end

# DESTROY
delete '/users/:id' do |id|
  album = Album.find(id)
  album.destroy
  redirect('/users/all')
end

