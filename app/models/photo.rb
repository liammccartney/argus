class Photo < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :album

  validates :photo_name, presence: true
  validates :photo_url, presence: true
  ##validate URL format
end
