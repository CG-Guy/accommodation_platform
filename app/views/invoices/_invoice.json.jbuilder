json.extract! invoice, :id, :paid, :due_date, :payment_type, :tax, :user_id, :composite_id, :composite_type, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
