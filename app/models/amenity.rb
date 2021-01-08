class Amenity < ApplicationRecord
  belongs_to :composite, polymorphic: true
end
