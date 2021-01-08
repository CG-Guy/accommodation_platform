class CreateListingAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_amenities do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :amenity_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
