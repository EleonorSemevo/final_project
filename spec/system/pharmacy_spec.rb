require 'rails_helper'
RSpec.describe 'Pharmacy management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new pharmacy' do
      it 'The created pharmacy is displayed' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        Area.create(name: 'Kpota', town: 'Calavi')
        Insurance.create(name: "Africaine des assurances")

        visit new_session_path
        fill_in 'Email', with: email
        fill_in 'Password', with: '123456'
        click_on 'Connect'
        click_on 'Pharmacies'
        click_on 'New Pharmacy'
        select 'Kpota', from: 'Area'
        fill_in 'Name', with: 'Pharmacy'
        fill_in 'Googlemap link', with: 'http://localhost:3000/admin/pharmacys/new'
        fill_in 'Number1', with: '+99999999'
        fill_in 'Number2', with: '+22999999'

        click_on 'Add New Pharmacy insurance'
        select 'Africaine des assurances', from: 'Insurance'

        click_on 'Create Pharmacy'
        expect(page).to have_content 'Pharmacy'
      end
    end
    context 'When Pharmacy is created' do
      it 'can consult the pharmacy detail' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        area = Area.create(name: 'Kpota', town: 'Calavi')

       hos = Pharmacy.create(name: "CNHU", area_id: area.id, all_nigth: true,
         googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
         number2:  Faker::PhoneNumber.phone_number)

          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'
          visit admin_pharmacy_path(hos)
          expect(page).to have_content 'CNHU'
      end
    end

    context 'When Pharmacy is created' do
        it 'can update pharmacy ' do
          email = Faker::Internet.email
           User.create(name: 'admin1', email: email,
             password: '123456', password_confirmation: '123456', admin: true)
          area = Area.create(name: 'Kpota', town: 'Calavi')

         hos = Pharmacy.create(name: "CNHU", area_id: area.id, all_nigth: true,
           googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
           number2:  Faker::PhoneNumber.phone_number)

            visit new_session_path
            fill_in 'Email', with: email
            fill_in 'Password', with: '123456'
            click_on 'Connect'

            visit edit_admin_pharmacy_path(hos)
              fill_in 'Name', with: 'Name1'
              click_on 'Update Pharmacy'

           expect(page).to have_content 'Name1'
      end
    end

    context 'When Pharmacy is created' do
      it 'can delete the Pharmacy' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        area = Area.create(name: 'Kpota', town: 'Calavi')

       hos = Pharmacy.create(name: "CNHU", area_id: area.id, all_nigth: true,
         googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
         number2:  Faker::PhoneNumber.phone_number)

          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'

         visit admin_pharmacies_path
         page.accept_confirm do
           click_link  'Delete'
         end
         expect(page).not_to have_content 'CNHU'
      end
    end
  end
end
