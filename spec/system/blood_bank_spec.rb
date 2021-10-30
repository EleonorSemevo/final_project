require 'rails_helper'
RSpec.describe 'BloodBank management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new blood_bank' do
      it 'The created blood_bank is displayed' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        Area.create(name: 'Kpota', town: 'Calavi')
        Insurance.create(name: "Africaine des assurances")

        visit new_session_path
        fill_in 'Email', with: email
        fill_in 'Password', with: '123456'
        click_on 'Connect'
        click_on 'Blood Banks'
        click_on 'New Blood Bank'
        select 'Kpota', from: 'Area'
        fill_in 'Name', with: 'BloodBank'
        fill_in 'Googlemap link', with: 'http://localhost:3000/admin/pharmaci/new'
        fill_in 'Number1', with: '+99999999'
        fill_in 'Number2', with: '+22999999'

        click_on 'Add New Blood bank insurance'
        select 'Africaine des assurances', from: 'Insurance'

        click_on 'Create Blood bank'
        expect(page).to have_content 'BloodBank'
      end
    end
    context 'When BloodBank is created' do
      it 'can consult the blood_bank detail' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        area = Area.create(name: 'Kpota', town: 'Calavi')

       hos = BloodBank.create(name: "CNHU", area_id: area.id,
         googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
         number2:  Faker::PhoneNumber.phone_number)

          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'
          visit admin_blood_bank_path(hos)
          expect(page).to have_content 'CNHU'
      end
    end

    context 'When BloodBank is created' do
        it 'can update blood_bank ' do
          email = Faker::Internet.email
           User.create(name: 'admin1', email: email,
             password: '123456', password_confirmation: '123456', admin: true)
          area = Area.create(name: 'Kpota', town: 'Calavi')

         hos = BloodBank.create(name: "CNHU", area_id: area.id,
           googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
           number2:  Faker::PhoneNumber.phone_number)

            visit new_session_path
            fill_in 'Email', with: email
            fill_in 'Password', with: '123456'
            click_on 'Connect'

            visit edit_admin_blood_bank_path(hos)
              fill_in 'Name', with: 'Name1'
              click_on 'Update Blood bank'

           expect(page).to have_content 'Name1'
      end
    end

    context 'When BloodBank is created' do
      it 'can delete the BloodBank' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        area = Area.create(name: 'Kpota', town: 'Calavi')

       hos = BloodBank.create(name: "CNHU", area_id: area.id,
         googlemap_link: "https://goo.gl/maps/WW5KCBCN4UVDaFzd9", number1:  Faker::PhoneNumber.phone_number,
         number2:  Faker::PhoneNumber.phone_number)

          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'

         visit admin_blood_banks_path
         page.accept_confirm do
           click_link  'Delete'
         end
         expect(page).not_to have_content 'CNHU'
      end
    end
  end
end
