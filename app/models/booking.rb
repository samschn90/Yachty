class Booking < ApplicationRecord
  enum :availability, { free: 0, reserved: 1, booked: 2 }
  belongs_to :user
  belongs_to :yacht
end
