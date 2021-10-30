class UsersController < InheritedResources::Base
    before_action :only_owner, only: [:edit, :update, :destroy,:show]
    # before_action :only_owner, only: 
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
   def only_owner
     if current_user.id != User.find(params[:id]).id
       flash[:notice] = "Unpermitted action!"
       redirect_to hospitals_path
     end
   end
    def user_params
      params.require(:user).permit(:name, :email, :admin, :password_confirmation, :password)
    end
end
