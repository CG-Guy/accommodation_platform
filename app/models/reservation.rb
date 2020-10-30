class Reservation < ApplicationRecord
  belongs_to :sub_listing
  belongs_to :user
end
