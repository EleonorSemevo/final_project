5.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create(name: name,
               email: email,
               password: password,
               )
end

5.times do |m|
  name = Faker::Games::Pokemon.name
  Speciality.create(name: name)
end

5.times do |m|
  name =Faker::String.random
  town = Faker::String.name
  Area.create(name: name, town: town)
end

5.times do |m|
  name =Faker::Company.name
  Insurance.create(name: name)
end

public = true

5.times do |m|
  name =Faker::Company.name
  public = public
  area_id = m
  googlemap_link = Faker::LoremFlickr.pixelated_image

  number1 = Faker::PhoneNumber.phone_number
  number2 = Faker::PhoneNumber.phone_number

  Hospital.create(name: name, area_id: area_id, public: public,
    googlemap_link: googlemap_link, number1: number1, number2: number1)
end

# 5.times do |m|
#   name =Faker::Company.name
#   public = public
#   area_id = m
#   googlemap_link = Faker::LoremFlickr.pixelated_image
#   number1 = Faker::PhoneNumber.phone_number
#   number2 = Faker::PhoneNumber.phone_number
#
#   Hospital.create(name: name, area_id: area_id, all_nigth: public,
#     googlemap_link: googlemap_link, number1: number1, number2: number1)
# end

5.times do |m|
  HospitalSpeciality.create(hospital_id: m, speciality_id: m)
end

5.times do |m|
  name =Faker::Company.name
  area_id = m
  googlemap_link = Faker::LoremFlickr.pixelated_image
  number1 = Faker::PhoneNumber.phone_number
  number2 = Faker::PhoneNumber.phone_number

  BloodBank.create(name: name, area_id: area_id,
    googlemap_link: googlemap_link, number1: number1, number2: number1)
end

5.times do |m|
  Timetable.create(hospital_speciality_id: m, day: m,
    start_hour: m, end_hour: m+1)
end

5.times do |m|
  name =Faker::Company.name
  area_id = m
  googlemap_link = Faker::LoremFlickr.pixelated_image
  number1 = Faker::PhoneNumber.phone_number
  number2 = Faker::PhoneNumber.phone_number

  Pharmacy.create(name: name, area_id: area_id,
    googlemap_link: googlemap_link, number1: number1, number2: number1)
end

5.times do |m|


  PharmacyInsurance.create(pharmacy_id: m, insurance_id: m)
end

5.times do |m|
  HospitalInsurance.create(hospital_id: m, insurance_id: m)
end

5.times do |m|
  BloodBankInsurance.create(blood_bank_id: m, insurance_id: m)
end

5.times do |m|
  content = Faker::Lorem.characters(number: 50, min_alpha: 4, min_numeric: 1)
  Comment.create(user_id: m, content: content)
end

5.times do |m|
  Favorite.create(user_id: m, comment_id: m)
end
