class RequestsController < ApplicationController
  ##
  # This Method lists all the requests
  def index
    @requests = Request.all
  end
    
  def show
    @request = Request.find(params[:id])
  end
    
  def new
    @request = Request.new
  end
   
  def create
    @request = Request.new(requests_params)
      if @request.save
      redirect_to welcome_homepage_url
      else
      render 'new'
      end
  end
   
  ##
  # This Method deletes the requests form the database 
  # after either accepting or rejecting.
  #
  # Gets the user whose email is the same as the user email of the request.
  #
  # If the request is accepted,
  # User becomes a publisher. 
  def destroy
    @request = Request.find(params[:id])
    @user = User.where(:email => @request.user_email).take
    @request.destroy
    @request.save
      if params[:number] == "1"
      @user.publisher = true
      @user.save
      end
   redirect_to requests_path
  end

  private
  def requests_params
    params.require(:request).permit(:reason, :user_email)
  end
 
end