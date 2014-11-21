get '/albums/all' do
  @albums = Album.all
  erb :'/albums/all'
end
# CREATE
get '/albums/new' do
  erb :'/albums/new'
end

post '/albums' do
  puts "PARAMS:"
  p "*" * 100
  p params
  puts "ALBUM:"
  p "*" * 100
  album = Album.create(params[:album])
  # implement album to user association using cookies after being implemented
  p album
  redirect("/albums/#{album.id}")
end
#NO UPDATE method -- add later

# READ
get '/albums/:id' do
  @album = Album.find(params[:id])
  erb :'/albums/show'
end

# DELETE
delete '/albums/:id' do |id|
  album = Album.find(id)
  album.destroy
  redirect('/albums/all')
end
