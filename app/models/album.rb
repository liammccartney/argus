class Album < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :photos
  validates :album_name, presence: true

end
