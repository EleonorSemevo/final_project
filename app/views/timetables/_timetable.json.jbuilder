json.extract! timetable, :id, :hospital_speciality_id, :day, :start_hour, :end_hour, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
