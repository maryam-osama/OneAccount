class PurchasesController < ApplicationController
    
    
      def index
  purchases = Purchase.where(user_email: current_user.email)
  @app_names = purchases.map{|p| Application.find(p.app_id) }
    end
    
    
end
