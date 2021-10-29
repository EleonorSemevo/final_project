class UsersController < InheritedResources::Base
  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        current_user = @user
        redirect_to hospitals_path
    else
      render :new, status: :unprocessable_entity
    end
  end



  private
    def user_params
      params.require(:user).permit(:name, :email, :admin, :password_confirmation, :password)
    end
end
