class RequestsController < ApplicationController
  def index
<<<<<<< HEAD
    @requests=Request.all
  end
    
  def show
    @request=Request.find(params[:id])
=======
    @requests = Request.all
  end
    
  def show
    @request = Request.find(params[:id])
>>>>>>> Test
  end
    
  def new
    @request = Request.new
  end
   
  def create
    @request = Request.new(requests_params)
    @request.save
    redirect_to welcome_homepage_url
  end
   
  def destroy
   @request = Request.find(params[:id])
   @user = User.where(:email => @request.user_email).take
   
   @request.destroy
   @request.save
<<<<<<< HEAD
     if  params[:number] == "1"
     current_user.publisher = true
     @current_user.save
     end
   redirect_to requests_path
  end
  
=======
  
   if params[:number] == "1"
   @user.publisher = true
   @user.save
   end
   redirect_to requests_path
    end

>>>>>>> Test
  private
  def requests_params
   params.require(:request).permit(:reason, :user_email)
  end
 
end
