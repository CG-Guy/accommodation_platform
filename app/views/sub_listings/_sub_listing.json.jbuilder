json.extract! sub_listing, :id, :status, :price, :rooms, :guest, :created_at, :updated_at
json.url sub_listing_url(sub_listing, format: :json)
