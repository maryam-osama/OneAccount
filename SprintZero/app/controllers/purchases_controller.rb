##
# This is a class of purchases.
class PurchasesController < ApplicationController
  ##
  # Saves all the application names purchased by
  # the user who logged in which
  # will be listed in the view.
  def index
    @purchases = Purchase.where(user_email: current_user.email)
    @app_names = @purchases.map { |p| Application.where(id: p.app_id).first}
  end
  
  def updated
    @purchase = Purchase.find(params[:number])
    @purchase.updated = true 
    @purchase.save  
    redirect_to params[:url] 
  end
     
end
