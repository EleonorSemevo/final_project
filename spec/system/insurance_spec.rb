require 'rails_helper'
RSpec.describe 'Insurance management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new insurance' do
      it 'The created insurance is displayed' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        insurance = Insurance.create(name: "odontologie")

        visit new_session_path
        fill_in 'Email', with: email
        fill_in 'Password', with: '123456'
        click_on 'Connect'
        click_on 'Insurances'
        click_on 'New Insurance'

        fill_in 'Name', with: 'insurance'

        click_on 'Create Insurance'
        expect(page).to have_content 'insurance'
      end
    end
    context 'When BloodBank is created' do
      it 'can consult the insurance detail' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        insurance = Insurance.create(name: "odontologie")


          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'
          visit admin_insurance_path(insurance)
          expect(page).to have_content 'odontologie'
      end
    end

    context 'When BloodBank is created' do
        it 'can update insurance ' do
          email = Faker::Internet.email
           User.create(name: 'admin1', email: email,
             password: '123456', password_confirmation: '123456', admin: true)
          insurance = Insurance.create(name: "odontologie")

            visit new_session_path
            fill_in 'Email', with: email
            fill_in 'Password', with: '123456'
            click_on 'Connect'

            visit edit_admin_insurance_path(insurance)
              fill_in 'Name', with: 'Name1'
              click_on 'Update Insurance'

           expect(page).to have_content 'Name1'
      end
    end

    context 'When BloodBank is created' do
      it 'can delete the BloodBank' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        area = Area.create(name: 'Kpota', town: 'Calavi')

       insurance = Insurance.create(name: "odontologie")

          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'

         visit admin_insurances_path
         page.accept_confirm do
           click_link  'Delete'
         end
         expect(page).not_to have_content 'odontologie'
      end
    end
  end
end
