# ALL
get '/albums/all' do
  @user = User.find(session[:user_id])
  @albums = @user.albums
  erb :'/albums/all'
end
# CREATE
get '/albums/new' do
  erb :'/albums/new'
end

post '/albums' do
  album = Album.new(params[:album])

  if album.save
    user = User.find(session[:user_id])
    user.albums << album
    redirect("/albums/#{album.id}")
  else
    session[:error] = album.errors.messages
    redirect("/albums/new")
  end
end

# READ
get '/albums/:id' do
  @album = Album.find(params[:id])
  erb :'/albums/show'
end

# UPDATE
get '/albums/:id/update' do
  @album = Album.find(params[:id])
  erb :'/albums/update'
end

put '/albums/:id' do
  @album = Album.find(params[:id])
  @album.update(params[:album])
  redirect("/albums/#{@album.id}")
end

# DELETE
delete '/albums/:id' do |id|
  album = Album.find(id)
  album.destroy
  redirect('/albums/all')
end
