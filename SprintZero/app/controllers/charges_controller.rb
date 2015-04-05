class ChargesController < ApplicationController
  def new; end

  def create
<<<<<<< HEAD
  # Amount in cents
=======
>>>>>>> Test
    @amount = params[:number]   
    customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
<<<<<<< HEAD
   )
=======
    )
>>>>>>> Test
    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
<<<<<<< HEAD
   )
    @purchase = Purchase.new
=======
    )
    @purchase =Purchase.new
>>>>>>> Test
    @purchase.user_email = current_user.email
    @purchase.app_id = params[:application]
    @purchase.save
    rescue Stripe::CardError => e
    flash[:error] = e.message
<<<<<<< HEAD
    redirect_to charges_path(params[:number],params[:application])
  end

end


=======
    redirect_to charges_path(params[:number], params[:application])
  end
  
end
>>>>>>> Test
