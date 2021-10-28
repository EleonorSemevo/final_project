class SessionsController < ApplicationController
  # skip_before_action :login_required, only: [:new, :create]
  # before_action :already_logged_in, only: [:new]

 def new
 end

 def guest_user
   user = User.find_by(email: 'guest@gmail.com')
   if user && user.authenticate('guest1234')
     session[:user_id] = user.id
       redirect_to hospitals_path
       flash[:notice] = "Loggin successfully!"
   else
     flash[:notice] = "Loggin error!"
   end
 end

 def guest_admin
   user = User.find_by(email: 'guestadmin@gmail.com')
   if user && user.authenticate('guestadmin123')
     session[:user_id] = user.id
     flash[:notice] = "Loggin successfully!"
     redirect_to admin_users_path
   else
     flash[:notice] = "Loggin error!"
   end
 end


 def create
   user = User.find_by(email: params[:session][:email].downcase)
   if user && user.authenticate(params[:session][:password])
     session[:user_id] = user.id

     if user.admin
       flash[:notice] = "Logged in successfully!"
       redirect_to admin_users_path
     else
       redirect_to hospitals_path
     end
   else
     flash.now[:danger] = 'Failed to login'
     render :new
   end
 end

 def destroy
   session.delete(:user_id)
   flash[:notice] = "Logged out isuccessfully"
   redirect_to hospitals_path
 end

 private
 def already_logged_in
   if current_user.present?
     if current_user.admin
       redirect_to admin_users_path
      else
       redirect_to hospitals_path
     end
   end
 #   redirect_to hospitals_path
 end
end
