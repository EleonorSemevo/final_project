class FavoritesController < InheritedResources::Base

def create
  # if params[:like]
  #   Favorite.create(user_id: current_user.id, comment_id: params[:comment_id])
  #   puts "***************"
  #   format.js { render :back }
  # elsif params[:unlike]
  #   favorite = Favorite.where('user_id = ? and comment_id= ?', current_user.id,  params[:comment_id])
  #   favorite.destroy
  #   puts "***************"

    favorite = Favorite.new(user_id: current_user.id, comment_id: params[:comment_id])

    # respond_to do |format|
      if favorite.save
        # format.js {
          redirect_back fallback_location: hospitals_path
         # }
      else
        # format.html {
          redirect_back fallback_location: hospitals_path
        # }
      end
    # end


end
  private

    def favorite_params
      params.require(:favorite).permit(:user_id, :comment_id, :like, :unlike)
    end

end
