require 'rails_helper'
RSpec.describe 'User management', type: :system do
  # let!(:user1) { FactoryBot.create(:user1) }
  # let!(:task) { FactoryBot.create(:task, user: user) }
  describe 'New  user creation function' do
    context 'When registering a new user' do
      it 'The created user is connected' do
        visit new_user_path
        fill_in 'Name' , with: 'Loren'
        fill_in 'Email' , with: 'lore@gmail.com'
        fill_in 'Password' , with: '123456'
        fill_in 'Password confirmation' , with: '123456'
        click_on 'Register'

        expect(page).to have_content 'Se déconnecter'
      end
    end

    context 'When user logged in' do
      it 'shows the logout button' do
        FactoryBot.create(:user, name: 'Loren', email: 'damy@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
        visit new_session_path
        fill_in 'Email' , with: 'damy@gmail.com'
        fill_in 'Password' , with: '123456'
        click_on 'Login'
        expect(page).to have_content 'Se déconnecter'
      end
    end
  end

  describe 'Restricton access to resources' do
    # before do
    #     # USER LOGIN BEFORE ANYTHING HERE
    #    FactoryBot.create(:user, name: 'Loren', email: 'damy@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
    #    visit new_session_path
    #    fill_in 'Email' , with: 'damy@gmail.com'
    #    fill_in 'Password' , with: '123456'
    #    click_on 'Login'
    # end

    context 'user can access hospitals page without login' do
      it 'access hospitals path' do
        visit hospitals_path
        expect(page).to have_content 'hospital'
      end
    end
    #
    context 'user can access pharmacies page without login' do
      it 'access pharmacies path' do
        visit pharmacies_path
        expect(page).to have_content 'pharmacy'
      end
    end
    #
    context 'user can access blood bank page without login' do
      it 'access pharmacies path' do
        visit blood_banks_path
        expect(page).to have_content 'blood bank'
      end
    end

    context 'user cannot submit comment without login' do
      it 'access pharmacies path' do
        visit hospitals_path
        fill_in 'Contenu' , with: 'Morning thing!'
        click_on 'Envoyer'
        expect(page).to have_content 'Se connecter pour laisser un commentaire'
      end
    end
    #
    # context 'user cannot update comment without login' do
    # end
    #
    # context 'user cannot delete comment without login' do
    # end
  end
end
