json.extract! @restaurant, :id, :wait_time
json.url restaurant_url(@restaurant, format: :json)
