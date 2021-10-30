require 'rails_helper'
RSpec.describe 'User management', type: :system do
  # let!(:user1) { FactoryBot.create(:user1) }
  # let!(:task) { FactoryBot.create(:task, user: user) }
  describe 'New  user creation function' do
    context 'When registering a new user' do
      it 'The created user is connected' do
        visit new_user_path
        # fill_in User.human_attribute_name("name") , with: 'Loren'
        fill_in 'Name', with: 'Loren'
        fill_in 'Email', with: 'eleonor@gmail.com'
        fill_in 'Password' , with: '123456'
        fill_in 'Password confirmation', with: '123456'
        click_on 'Register'

        expect(page).to have_content 'logout'
      end
    end

    context 'When user logged in' do
      it 'shows the logout button' do
        FactoryBot.create(:user, name: 'Loren', email: 'fleur@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
        visit new_session_path
        fill_in 'Email' , with: 'fleur@gmail.com'
        fill_in 'Password' , with: '123456'
        click_on 'Connect'
        expect(page).to have_content 'logout'
      end
    end
  end

  describe 'Restricton access to resources' do
  #   # before do
  #   #     # USER LOGIN BEFORE ANYTHING HERE
  #   #    FactoryBot.create(:user, name: 'Loren', email: 'damy@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
  #   #    visit new_session_path
  #   #    fill_in 'Email' , with: 'damy@gmail.com'
  #   #    fill_in 'Password' , with: '123456'
  #   #    click_on 'Login'
  #   # end
  #
    context 'When user click on hospitals link without login' do
      it 'can ccess hospitals page' do
        visit hospitals_path
        expect(page).to have_content 'hospital'
      end
    end

    context 'When user click on pharmacies link without login' do
      it 'access pharmacies path' do
        visit pharmacies_path
        expect(page).to have_content 'pharmacy'
      end
    end

    context 'When user click on blood bank link without login' do
      it 'can access blood bank page' do
        visit blood_banks_path
        expect(page).to have_content 'blood bank'
      end
    end

    context 'When user submit comment without login' do
      it 'will be redirected to login page' do
        visit hospitals_path
        fill_in 'Content' , with: 'Morning thing!'
        click_on 'Comment'
        expect(page).to have_content 'Login to leave a comment'
      end
    end

    context 'When user click on like button without login ' do
      user = FactoryBot.create(:user, name: 'Loren', email: 'moonli@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
      Comment.create(user_id: user.id, content: "content")

      it 'will be redirected to login page' do
        visit hospitals_path
        click_on 'Like'
        expect(page).to have_content 'Login to leave a comment'
      end
    end
    #
    # context 'user cannot delete comment without login' do
    # end
  end
end
