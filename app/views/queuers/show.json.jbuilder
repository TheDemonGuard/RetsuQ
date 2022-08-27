json.extract! @queuer, :id, :wait_time, :position, :people, :estimated
json.url restaurant_url(@queuer, format: :json)
