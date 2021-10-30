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
    context 'When user is not logged in' do
      it 'cannot delete comment without login' do
        visit hospitals_path
        expect(page).not_to have_content 'Delete'
      end

      it 'cannot update comment without login' do
        visit hospitals_path
        expect(page).not_to have_content 'Edit'
      end
      it 'cannot consult profil' do
        visit hospitals_path
        expect(page).not_to have_content 'Account'
      end

      it 'cannot edit profile' do
        visit hospitals_path
        expect(page).not_to have_content 'Account'
      end
      it 'cannot access admin dashbord' do
        visit admin_root_path
        expect(page).to have_content 'You are not an admin'
      end
    end

    context 'When user is logged in as simple user' do
      it 'can create comment' do
        FactoryBot.create(:user2, name: 'Lam', email: 'fleurie@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
        visit new_session_path
        fill_in 'Email', with: 'fleurie@gmail.com'
        fill_in 'Password', with: '123456'
        click_on 'Connect'

        fill_in 'Content', with: 'Some content'
        click_on 'Comment'


        expect(page).to have_content 'Some content'
      end
      it 'can update comment' do
        # user= User.find_by(email: 'fleurie@gmail.com')
        # user.destroy
      user =  FactoryBot.create(:user3, name: 'Lama', email: 'lama@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
        comment = Comment.create(content: "some content", user_id: user.id)
        visit new_session_path
        fill_in 'Email', with: 'lama@gmail.com'
        fill_in 'Password', with: '123456'
        click_on 'Connect'
        #
        # click_on 'Edit'
        # fill_in 'Content', with: 'new content'
        # click_on 'Update Comment'
        comment.update(content: 'new content')
        visit hospitals_path
        expect(page).to have_content 'new content'
      end
      it 'can delete comment' do
        user =  FactoryBot.create(:user4, name: 'lolo', email: 'lolo@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
          comment = Comment.create(content: "some content", user_id: user.id)
          visit new_session_path
          fill_in 'Email', with: 'lolo@gmail.com'
          fill_in 'Password', with: '123456'
          click_on 'Connect'
          #
          # click_on 'Edit'
          # fill_in 'Content', with: 'new content'
          # click_on 'Update Comment'
          # comment.update(content: 'new content')
          # click_on 'Delete'
          page.accept_confirm do
            click_link  'Delete'
          end
          expect(page).not_to have_content 'some content'
      end
    #   it 'can consult profil' do
    #
    #   end
    #
    #   it 'can edit profile' do
    #
    #   end
    #
    #   it 'cannot edit other people profile' do
    #
    #   end
    #
    #   it 'cannot consult other people profile' do
    #
    #   end
    #
    #   it 'cannot access admin dashbord' do
    #
    #   end
    #
    # end
    #
    # context 'When user is logged in as an admin' do
    #   it 'can access admin panel' do
    #
    #   end
    # end
  end









  end
end
