class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_name
      t.string :photo_url
      t.references :album

      t.timestamps
    end
  end
end
