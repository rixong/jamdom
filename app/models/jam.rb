class Jam < ApplicationRecord
  has_many :user_jams
  has_many :users, through: :user_jams
  belongs_to :space
  has_many :genre_jams
  has_many :genres, through: :genre_jams


  def is_host?(user)
    result = UserJam.where("user_id = ? AND jam_id = ?", user.id, self.id )[0]
    if result.status = 'host'
      true
    else
      false
    end
  end
end
