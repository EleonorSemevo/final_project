5.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create(name: name,
               email: email,
               password: password,
               password_confirmation: password
               )
end

# 5.times do |m|
#   name = Faker::Games::Pokemon.name
#   Speciality.create(name: name)
# end
Speciality.create(name: "Radiologie")
Speciality.create(name: "Dermatologie")
Speciality.create(name: "Anestthesiology")
Speciality.create(name: "Neurology")
Speciality.create(name: "Pathologie")

# 5.times do |m|
#   name =Faker::Movie.title
#   town = Faker::Movie.quote
#   Area.create(name: name, town: town)
# end

Area.create(name: 'Kpota', town: 'Calavi')
Area.create(name: 'Togoudo', town: 'Calavi')
Area.create(name: 'Cadjehoun', town: 'Cotonou')
Area.create(name: 'Minnontin', town: 'Cotonou')
Area.create(name: 'Zinvié', town: 'Calavi')

# 5.times do |m|
#   name =Faker::Company.name
#   Insurance.create(name: name)
# end
Insurance.create(name: "Africaine des assurances")
Insurance.create(name: "La GAB SA")
Insurance.create(name: "NSIA Benin")
Insurance.create(name: "FEDAS")
Insurance.create(name: "SAHAM")

public = true

# 5.times do |m|
#   name =Faker::Company.name
#   public = public
#   area_id = m+1
#   googlemap_link = Faker::LoremFlickr.pixelated_image
#
#   number1 = Faker::PhoneNumber.phone_number
#   number2 = Faker::PhoneNumber.phone_number
#
#   Hospital.create(name: name, area_id: area_id, public: public,
#     googlemap_link: googlemap_link, number1: number1, number2: number1)
# end

Hospital.create(name: "CNHU", area_id: 3, public: public,
  googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
  number2:  Faker::PhoneNumber.phone_number)

Hospital.create(name: "Hôpital de zone de minnontin", area_id: 4, public: public,
  googlemap_link: "https://goo.gl/maps/DxyjD1GtgXtXRntr9", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)

Hospital.create(name: "Hôpital de zone de calavi ", area_id: 1, public: public,
  googlemap_link: "https://goo.gl/maps/ao2EiND5tCemFXC57", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)

Hospital.create(name: "Hôpital croix de zinvié ", area_id: 5, public: public,
  googlemap_link: "https://goo.gl/maps/edKNrwrvJiYwWgGc7", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)

Hospital.create(name: "Biosso ", area_id: 2, public: public,
  googlemap_link: "https://goo.gl/maps/XAwHPBYyMSqYzNCG7", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)



5.times do |m|
  HospitalSpeciality.create(hospital_id: m+1, speciality_id: m+1)
end

# 5.times do |m|
#   name =Faker::Company.name
#   area_id = m+1
#   googlemap_link = Faker::LoremFlickr.pixelated_image
#   number1 = Faker::PhoneNumber.phone_number
#   number2 = Faker::PhoneNumber.phone_number
#
#   BloodBank.create(name: name, area_id: area_id,
#     googlemap_link: googlemap_link, number1: number1, number2: number1)
# end
BloodBank.create(name: "Banque de sang du Borgou", area_id: 1,
  googlemap_link: "https://goo.gl/maps/xs84awHndShCoNPi7", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)
BloodBank.create(name: "CNHU", area_id: 2,
  googlemap_link: "https://goo.gl/maps/xs84awHndShCoNPi7", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)
BloodBank.create(name: "CNTS", area_id: 3,
  googlemap_link: "https://goo.gl/maps/xs84awHndShCoNPi7", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)
BloodBank.create(name: "Banque de sang d'aliborie", area_id: 4,
  googlemap_link: "https://goo.gl/maps/xs84awHndShCoNPi7", number1:  Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)
BloodBank.create(name: "Banque de sang OMEL", area_id: 5,
  googlemap_link: "https://goo.gl/maps/xs84awHndShCoNPi7", number1: Faker::PhoneNumber.phone_number, number2:  Faker::PhoneNumber.phone_number)

5.times do |m|
  Timetable.create(hospital_speciality_id: m+1, day: m+1,
    start_hour: m+1, end_hour: m+1)
end

# 5.times do |m|
#   name =Faker::Company.name
#   area_id = m+1
#   googlemap_link = Faker::LoremFlickr.pixelated_image
#   number1 = Faker::PhoneNumber.phone_number
#   number2 = Faker::PhoneNumber.phone_number
#
#   Pharmacy.create(name: name, area_id: area_id,
#     googlemap_link: googlemap_link, number1: number1, number2: number1)
# end

Pharmacy.create(name: "Pharmacie les pylones", area_id: 1,
googlemap_link: "https://goo.gl/maps/mydJmC377jwe6wuT8", number1: Faker::PhoneNumber.phone_number, number2: Faker::PhoneNumber.phone_number)
Pharmacy.create(name: "Pharmacie cadjehoun", area_id: 2,
googlemap_link: "https://goo.gl/maps/PbzRYHCZ8xCpmGq18", number1: Faker::PhoneNumber.phone_number, number2: Faker::PhoneNumber.phone_number)
Pharmacy.create(name: "Pharmacie Iita", area_id: 3,
googlemap_link: "https://goo.gl/maps/ZBzdRWUow2NBfk1t5", number1: Faker::PhoneNumber.phone_number, number2: Faker::PhoneNumber.phone_number)
Pharmacy.create(name: "pharmacie de l'amitié", area_id: 4,
googlemap_link: "https://goo.gl/maps/2itbwGzwarqv9kyE7", number1: Faker::PhoneNumber.phone_number, number2: Faker::PhoneNumber.phone_number)
Pharmacy.create(name: "Pharmacie Togoudo", area_id: 5,
googlemap_link: "https://goo.gl/maps/SzLo2dtEfsGnZThT8", number1: Faker::PhoneNumber.phone_number, number2: Faker::PhoneNumber.phone_number)

5.times do |m|
  PharmacyInsurance.create(pharmacy_id: m+1, insurance_id: m+1)
end

5.times do |m|
  HospitalInsurance.create(hospital_id: m+1, insurance_id: m+1)
end

5.times do |m|
  BloodBankInsurance.create(blood_bank_id: m+1, insurance_id: m+1)
end

5.times do |m|
  content = Faker::Lorem.characters(number: 50, min_alpha: 4, min_numeric: 1)
  Comment.create(user_id: m+1, content: content)
end

5.times do |m|
  Favorite.create(user_id: m+1, comment_id: m+1)
end

User.create(name: 'admin', email: 'admin@gmail.com', admin: true, password: 'admin123', password_confirmation: 'admin123')
User.create(name: 'guest', email: 'guest@gmail.com', password: 'guest1234', password_confirmation: 'guest1234')
User.create(name: 'guest admin', email: 'guestadmin@gmail.com', admin: true, password: 'guestadmin123', password_confirmation: 'guestadmin123')
