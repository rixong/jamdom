class User < ApplicationRecord
  has_many :user_jams
  has_many :jams, through: :user_jams
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :genre_users
  has_many :genres, through: :genre_users

  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  def self.instrument_search(id)
    User.joins(:user_instruments).where('user_instruments.instrument_id = ?', id)
  end

end
