class Yacht < ApplicationRecord
  has_many :bookings

  def available?(start_time, end_time)
    bookings.where("start_time <= ? AND end_time >= ?", end_time, start_time).empty?
  end

  belongs_to :user
  has_one_attached :photo
end
