class SubListing < ApplicationRecord
  belongs_to :listing
  has_many :reservations, dependent: :destroy


  scope :by_date, ->(checkin, checkout) { left_outer_joins(:reservations).where("reservations.check_in NOT BETWEEN ? AND ? OR reservations.check_in is null", checkin, checkout) }

end
