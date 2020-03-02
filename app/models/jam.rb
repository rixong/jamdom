class Jam < ApplicationRecord
  has_many :user_jams
  has_many :users, through: :user_jams
  belongs_to :space
  has_many :genre_jams
  has_many :genres, through: :genre_jams
end
