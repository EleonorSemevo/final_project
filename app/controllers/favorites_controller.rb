class FavoritesController < InheritedResources::Base

def create
  favorite = Favorite.new(user_id: current_user.id, comment_id: params[:comment_id])
    if favorite.save
        redirect_back fallback_location: hospitals_path
    else
        redirect_back fallback_location: hospitals_path
    end
end

private
def favorite_params
  params.require(:favorite).permit(:user_id, :comment_id, :like, :unlike)
end

end
