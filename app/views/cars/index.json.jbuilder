json.array!(@cars) do |car|
  json.extract! car, :id, :wheels, :make, :model
  json.url car_url(car, format: :json)
end
