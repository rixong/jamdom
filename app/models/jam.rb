class Jam < ApplicationRecord
  has_many :user_jams
  has_many :users, through: :user_jams
  belongs_to :space
  has_many :genre_jams
  has_many :genres, through: :genre_jams

  validates :date, presence: true
  validates :time, presence: true


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
    UserJam.where( "jam_id = ? AND status = ?", self.id, "host" )[0].user_id
  end

  def host_name
    User.find(host_id).name
  end

  def self.accept_request(user_id, jam_id)
    result = UserJam.where('user_id = ? AND jam_id = ?', user_id, jam_id)[0]
    result.delete
  end


  def self.accept_request(user_id, jam_id)
    result = UserJam.where('user_id = ? AND jam_id = ?', user_id, jam_id)[0]
    # binding.pry
    result.update(status: 'accepted')
  end

  

  
end
