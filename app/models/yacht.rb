class Yacht < ApplicationRecord
  belongs_to :user

  # validates :type, inclusion: { in: %w[Sailyacht Motoryacht Hybridyacht Flyingyacht] }
end
