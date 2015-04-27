class WishlistsController < ApplicationController
     ##
  # WISHLIST
  def wishlist
    @user = User.find(current_user.id)
    @wishlist = Wishlist.create(email: current_user.email, app_id: params[:app_id])
    @wishlist.save
    redirect_to welcome_homepage_url
  end
  private
  def wishlists_params
    params.require(:wishlist).permit(:email, :app_id)
  end
end
