class Review < ApplicationRecord
  belongs_to :user
  belongs_to :composite, polymorphic: true
  has_many :sub_listings, as: :composite, dependent: :destroy
  accepts_nested_attributes_for :sub_listings, allow_destroy: true, reject_if: :all_blank
  validates :user, uniqueness: { scope: [:composite_id, :composite_type] }
end
