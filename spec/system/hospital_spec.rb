require 'rails_helper'
RSpec.describe 'Hospital management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new hospital' do
      it 'The created hospital is displayed' do

        FactoryBot.create(:admin1, name: 'admin1', email: 'admin1@gmail.com',
           password: '123456', password_confirmation: '123456', admin: true)
       Area.create(name: 'Kpota', town: 'Calavi')
       Area.create(name: 'Togoudo', town: 'Calavi')
       Speciality.create(name: "Radiologie")
       Speciality.create(name: "Dermatologie")

       Insurance.create(name: "Africaine des assurances")
       Insurance.create(name: "La GAB SA")

        visit new_session_path
        fill_in 'Email', with: 'admin1@gmail.com'
        fill_in 'Password', with: '123456'
        click_on 'Connect'
        click_on 'Hospitals'
        click_on 'New Hospital'
        select 'Kpota', from: 'Area'
        fill_in 'Name', with: 'Hospital'
        fill_in 'Googlemap link', with: 'http://localhost:3000/admin/hospitals/new'
        fill_in 'Number1', with: '+99999999'
        fill_in 'Number2', with: '+22999999'

        click_on 'Add New Hospital speciality'
        select 'Radiologie', from: 'Speciality'
        click_on 'Add New Timetable'
        select 'Lundi', from: 'Day'
        select '20', from: 'Start hour'
        select '21', from: 'End hour'

        click_on 'Add New Hospital insurance'
        select 'Africaine des assurances', from: 'Insurance'

        click_on 'Create Hospital'
        expect(page).to have_content 'Hospital'
      end
    end
    context 'When Hospital is created' do
      it 'can consult the hospital detail' do
       FactoryBot.create(:admin7, name: 'admin7', email: 'admin7@gmail.com',
           password: '123456', password_confirmation: '123456', admin: true)
       area = Area.create(name: 'Kpota', town: 'Calavi')

       hos = Hospital.create(name: "CNHU", area_id: area.id, public: true,
         googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
         number2:  Faker::PhoneNumber.phone_number)

          visit new_session_path
          fill_in 'Email', with: 'admin7@gmail.com'
          fill_in 'Password', with: '123456'
          click_on 'Connect'
          visit admin_hospital_path(hos)
          expect(page).to have_content 'CNHU'
      end
    end

    context 'When Hospital is created' do
        it 'can update hospital ' do
         FactoryBot.create(:admin3, name: 'admin3', email: 'admin3@gmail.com',
             password: '123456', password_confirmation: '123456', admin: true)
         area = Area.create(name: 'Kpota', town: 'Calavi')

         hospital = Hospital.create(name: "CBU", area_id: area.id, public: true,
           googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
           number2:  Faker::PhoneNumber.phone_number)

           visit new_session_path
           fill_in 'Email', with: 'admin3@gmail.com'
           fill_in 'Password', with: '123456'
           click_on 'Connect'
           visit edit_admin_hospital_path(hospital)
           fill_in 'Name', with: 'Name1'
           click_on 'Update Hospital'
           expect(page).to have_content 'Name1'
      end
    end

    context 'When Hospital is created' do
      it 'can delete the Hospital' do
        hos = FactoryBot.create(:admin3, name: 'admin3', email: 'admin3@gmail.com',
           password: '123456', password_confirmation: '123456', admin: true)
       area = Area.create(name: 'Kpota', town: 'Calavi')

       Hospital.create(name: "CPU", area_id: area.id, public: true,
         googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
         number2:  Faker::PhoneNumber.phone_number)

         visit new_session_path
         fill_in 'Email', with: 'admin3@gmail.com'
         fill_in 'Password', with: '123456'
         click_on 'Connect'
         visit admin_hospitals_path
         page.accept_confirm do
           click_link  'Delete'
         end
         expect(page).not_to have_content 'CPU'
      end
    end
  end
end
