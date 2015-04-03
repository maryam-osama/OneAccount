 ## 
 #This is class of applications
class ApplicationsController < ApplicationController
  def new; end
    
    ## 
    #This method lists all the publisher's app
    #
    #By  checking if the applications model have current_user_Email as a publisher email
    # 
    #Then it loops on these applications
    # and views the appname of this applications
  def myapps
    @applications = Application.where(publisher_email: current_user.email)
  end

  def index
    params[:search]&&@applications = Application.search(params[:search]).order("created_at DESC")
  end
    # It returns the articles whose titles contain one or more words that form the query

  def show
    @application = Application.find(params[:id])
  end
    
  def create 
    @application = Application.new(application_params)
    @application.save
    @application.publisher_email  = current_user.email
    @application.save
    redirect_to @application
  end
    
  private
  def application_params
    params.require(:application).permit(:appname, :description, :price)
  end

end
    
   

