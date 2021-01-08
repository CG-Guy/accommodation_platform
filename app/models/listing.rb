class Listing < ApplicationRecord
  belongs_to :user
  has_rich_text :rich_description
  has_rich_text :amenities_description
  has_many :reviews, as: :composite, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_one :address, as: :composite, dependent: :destroy
  has_many :listing_amenities
  has_many :amenity_items, through: :listing_amenities
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :sub_listings, as: :composite, dependent: :destroy
  has_many :information_blocks, as: :composite, dependent: :destroy
  # has_many :amenity_item, as: :composite, dependent: :destroy
  accepts_nested_attributes_for :listing_amenities, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :address, allow_destroy: true#, reject_if: :all_blank
  accepts_nested_attributes_for :information_blocks, allow_destroy: true
  accepts_nested_attributes_for :sub_listings, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :attachments, allow_destroy: true, reject_if: :all_blank
end
