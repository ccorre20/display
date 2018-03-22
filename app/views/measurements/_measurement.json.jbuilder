json.extract! measurement, :id, :date, :temp, :hum, :created_at, :updated_at
json.url measurement_url(measurement, format: :json)
