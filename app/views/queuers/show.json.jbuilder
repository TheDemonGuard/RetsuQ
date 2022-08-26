json.extract! @queuer, :id, :wait_time, :position, :people
json.url restaurant_url(@queuer, format: :json)
