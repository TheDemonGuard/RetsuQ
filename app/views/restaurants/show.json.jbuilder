json.extract! @restaurant, :id, :wait_time, :line_size
json.url restaurant_url(@restaurant, format: :json)
