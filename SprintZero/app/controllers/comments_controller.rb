class CommentsController < ApplicationController
  ##
  # Author: Khadija Ibrahim.
  #
  # This method creates and saves a comment.
  #
  # After recieving the body from the application/show view,
  #
  # it creates a comment and adds it to the 
  #
  # many comments this application has
  #
  # and sets commenter to email of current user. 
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

