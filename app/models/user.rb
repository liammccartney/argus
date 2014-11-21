class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  has_many :albums
  has_many :photos, through: :albums

  validates :name, uniqueness: true, presence: true
  validates :email, presence: true
  ##validate email format
end
