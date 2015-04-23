class CommentsController < ApplicationController
  ##
  #This method creates and saves a comment
  def create
    @application = Application.find(params[:application_id])
    @comment = @application.comments.create(comment_params)
    @comment.commenter = current_user.email
    @comment.save
    redirect_to application_path(@application)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
