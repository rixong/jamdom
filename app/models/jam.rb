class Jam < ApplicationRecord
  has_many :user_jams
  has_many :users, through: :user_jams
  belongs_to :space
  has_many :genre_jams
  has_many :genres, through: :genre_jams


  def is_host?(user)
      status(user) == 'host'
  end
  
  def status(user)
    if result = UserJam.where('user_id = ? AND jam_id = ?', user.id, self.id)[0]
      result.status
    end
  end

  def show_invite?(cur_user, shown_user)
    (cur_user != shown_user) && self.is_host?(cur_user) && !self.users.include?(shown_user)
  end

  def host_id
    result = UserJam.where( "jam_id = ? AND status = ?", self.id, "host" )[0].user_id
  end

  
end
