##
# Author: Rawan
# Class for creating a wishlist
class WishlistsController < ApplicationController
  
  ##
  # Method for defining a new wishlist
  # by taking the app_id, user email, user id
  # and adding them in the Wishlist model
  def new
    @user = User.find(current_user.id)
    @wishlist = Wishlist.new
    @wishlist.email = current_user.email
    @wishlist.app_id = params[:app_id]
    @wishlist.user_id = current_user.id
    @wishlist.save
    redirect_to welcome_homepage_url
  end
  
  ##
  # Lists the wishes of each user
  def show
    Wishlist.all.each do |wishlist| 
      if wishlist.email == current_user.email
        if wishlist.app_id != nil
          @application = Application.find (wishlist.app_id)
        end
      end
    end
  end
  
  ##
  # Method for destroying a specific record from Wishlist
  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy
    redirect_to welcome_homepage_url
  end
  
  private
  def wishlists_params
    params.require(:wishlist).permit(:email, :app_id)
  end
  
end