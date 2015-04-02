class PurchasesController < ApplicationController
     ##
     # This is a class of purchases,
     # it has method index that saves all
     # the application names purchased by
     # the user who logged in.
     # A variable appnames which saves all the user's purchases
     # will be listed in the view.
     def index
  purchases = Purchase.where(user_email: current_user.email)
  @app_names = purchases.map { |p| Application.find(p.app_id) }
     end
end
