class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :composite, polymorphic: true
end
