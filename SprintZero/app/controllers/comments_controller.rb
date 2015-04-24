class CommentsController < ApplicationController
  ##
  #This method creates and saves a comment
  def create
    @application = Application.find(params[:application_id])
    @comment = @application.comments.create(comment_params)
    redirect_to application_path(@application)
    @comment.commenter = current_user.email
    @comment.save
  end
 
 ##
  # This method requests a comment with an id
  # from application model
  #
  # If comment with required id is found,
  # delet comment
  # 
  # Go back to the homepage
  def destroy
    @application = Application.find(params[:application_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to welcome_homepage_url
  end
  
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
