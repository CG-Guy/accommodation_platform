json.extract! review, :id, :comment, :value, :user_id, :composite_id, :composite_type, :created_at, :updated_at
json.url review_url(review, format: :json)
