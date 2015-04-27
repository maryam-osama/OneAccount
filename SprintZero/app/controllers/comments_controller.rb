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
 
 ##
  # Author: Basma Elgeziry
  #
  # This method requests a comment with an id
  # from application model
  #
  # If comment with required id is found,
  # delet comment
  # 
  # Go back to the application
  def destroy
    @application = Application.find(params[:application_id])
    @comment = @application.comments.find(params[:id])
    @comment.destroy
    redirect_to application_path(@application)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
