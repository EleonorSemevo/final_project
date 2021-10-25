class UsersController < InheritedResources::Base
  # before_action :set_user, only: %i[ show edit update destroy ]
  # before_action :my_account, only: [:edit, :update, :destroy, :show]
  # before_action :connected, only: [:new, :create]
  skip_before_action :login_required, only:  [:new, :create]

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
