json.extract! booking, :id, :room_id, :start, :end, :purpose, :created_at, :updated_at
json.url booking_url(booking, format: :json)
