class CurrenciesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
  #  customer = current_user.stripe_customer
  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )

    @amount = 500
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe Customer',
      currency: 'usd'
    )
    render action: :new
  end
end
