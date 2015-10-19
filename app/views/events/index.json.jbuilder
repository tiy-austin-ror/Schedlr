json.array!(@events) do |event|
  json.extract! event, :id, :start_time, :duration, :description, :room_id, :user_id
  json.url event_url(event, format: :json)
end
