class SubListing < ApplicationRecord
  belongs_to :composite, polymorphic: true
end
