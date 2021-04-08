class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :sub_listing
end
