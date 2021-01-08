class Address < ApplicationRecord
  belongs_to :composite, polymorphic: true
end
