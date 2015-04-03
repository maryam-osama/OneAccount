##
# This is a class of purchases.
class PurchasesController < ApplicationController
  ##
  # Saves all the application names purchased by
  # the user who logged in which
  # will be listed in the view.
  def index
    purchases = Purchase.where(user_email: current_user.email)
    @app_names = purchases.map { |p| Application.find(p.app_id) }
  end
     
end
