class CommentsController < InheritedResources::Base
  def create
     # = Blog.find(params[:blog_id])
    @comment = current_user.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.html { redirect_to hospitals_path }
      else
        format.html { redirect_to hospitals_path, notice: 'Couldn't post...' }
      end
    end
  end
  private

    def comment_params
      params.require(:comment).permit(:user_id, :content)
    end

end
