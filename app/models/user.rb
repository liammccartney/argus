class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  has_many :albums
  has_many :photos, through: :albums

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :on => :create}
  ##validate email format
end
