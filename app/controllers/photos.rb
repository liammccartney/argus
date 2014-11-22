get '/photos/upload' do
   @album = Album.find(params[:album][:id])

  erb :'photos/uploader'
end

post '/photos/upload' do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]
  params[:photo][:photo_url] = "/img/#{@filename}"

  File.open("public/img/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  album = Album.find(params[:id])
  album.photos.create(params[:photo])

  redirect("/albums/#{album.id}")

end

get '/photos/:id' do |id|
  @photo = Photo.find(id)
  erb :'photos/show'
end

delete '/photos/:id' do |id|
  photo = Photo.find(id)
  photo.destroy
  redirect('/albums/all')
end
