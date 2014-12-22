class ChargesController < ApplicationController

  def new
  end

  def create
    @product = Product.find(params[:id])
  # Amount in cents
  @amount = @product.price_form

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

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end

  def index
  end

  def show
  end

end
