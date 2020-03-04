class Instrument < ApplicationRecord
  has_many :user_instruments
  has_many :users, through: :user_instruments

  def self.get_instrument_by_id(id)
    arr = Instrument.where('id = ?', id)[0].name
  end
end
