module ApplicationHelper
  def favorite?(comment_id)
    Favorite.find_by(user_id: current_user.id, comment_id: comment_id).present?
  end

  def get_favorite(comment_id)
    Favorite.find_by(user_id: current_user.id, comment_id:comment_id)
  end
end
