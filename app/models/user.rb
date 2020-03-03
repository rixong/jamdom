class User < ApplicationRecord
  has_many :user_jams
  has_many :jams, through: :user_jams
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :genre_users
  has_many :genres, through: :genre_users

  has_secure_password
  
end
