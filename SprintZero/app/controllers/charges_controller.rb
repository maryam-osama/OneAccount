class ChargesController < ApplicationController
  def new; end

  def create
    @amount = params[:number]   
    customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
    )
    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )
    @purchase =Purchase.new
    @purchase.user_email = current_user.email
    @purchase.app_id = params[:application]
    @purchase.save
    redirect_to :back
    rescue Stripe::CardError => e
    flash[:error] = e.message
  end
  
end


