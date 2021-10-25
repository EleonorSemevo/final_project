class CommentsController < InheritedResources::Base

  before_action :set_comment, only: [:edit, :update, :destroy]
   def create
     # @blog = Blog.find(params[:blog_id])
     @comment = current_user.comments.build(comment_params)

     respond_to do |format|
       if @comment.save
         format.js { render :index }
       else
         format.html { redirect_to pharmacies_path, notice: 'impossible de publier..' }
       end
     end
   end

   def edit
       @comment = Comment.find(params[:id])
       respond_to do |format|
         flash.now[:notice] = 'Modification du commentaire'
         format.js { render :edit }
       end
     end

     def update
       @comment = Comment.find(params[:id])
         respond_to do |format|
           if @comment.update(comment_params)
             flash.now[:notice] = 'Commentaire modifié'
             format.js { render :index }
           else
             flash.now[:notice] = 'Échec de la modification du commentaire'
             format.js { render :edit_error }
           end
         end
     end

     def destroy
         @comment = Comment.find(params[:id])
         @comment.destroy
         respond_to do |format|
           flash.now[:notice] = 'Commentaire supprimé'
           format.js { render :index }
         end
     end

   private
   def comment_params
     params.require(:comment).permit(:user_id, :content)
   end
   def set_comment
     @comment = Comment.find(params[:id])
   end
 end
