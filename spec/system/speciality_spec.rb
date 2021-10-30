require 'rails_helper'
RSpec.describe 'Speciality management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new speciality' do
      it 'The created speciality is displayed' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        speciality = Speciality.create(name: "odontologie")

        visit new_session_path
        fill_in 'Email', with: email
        fill_in 'Password', with: '123456'
        click_on 'Connect'
        click_on 'Specialities'
        click_on 'New Speciality'

        fill_in 'Name', with: 'speciality'

        click_on 'Create Speciality'
        expect(page).to have_content 'speciality'
      end
    end
    context 'When BloodBank is created' do
      it 'can consult the speciality detail' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        speciality = Speciality.create(name: "odontologie")


          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'
          visit admin_speciality_path(speciality)
          expect(page).to have_content 'odontologie'
      end
    end

    context 'When BloodBank is created' do
        it 'can update speciality ' do
          email = Faker::Internet.email
           User.create(name: 'admin1', email: email,
             password: '123456', password_confirmation: '123456', admin: true)
          speciality = Speciality.create(name: "odontologie")

            visit new_session_path
            fill_in 'Email', with: email
            fill_in 'Password', with: '123456'
            click_on 'Connect'

            visit edit_admin_speciality_path(speciality)
              fill_in 'Name', with: 'Name1'
              click_on 'Update Speciality'

           expect(page).to have_content 'Name1'
      end
    end

    context 'When BloodBank is created' do
      it 'can delete the BloodBank' do
        email = Faker::Internet.email
         User.create(name: 'admin1', email: email,
           password: '123456', password_confirmation: '123456', admin: true)
        area = Area.create(name: 'Kpota', town: 'Calavi')

       speciality = Speciality.create(name: "odontologie")

          visit new_session_path
          fill_in 'Email', with: email
          fill_in 'Password', with: '123456'
          click_on 'Connect'

         visit admin_specialities_path
         page.accept_confirm do
           click_link  'Delete'
         end
         expect(page).not_to have_content 'odontologie'
      end
    end
  end
end
