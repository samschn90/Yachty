class AddAvailabilityToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :availability, :integer, default: 0
  end
end
