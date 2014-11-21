class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
