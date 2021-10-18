json.extract! hospital, :id, :name, :area_id, :public, :googlemap_link, :number1, :number2, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
