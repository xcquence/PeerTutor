class CurrenciesController < ApplicationController
  before_action :authenticate_user!


  def new
  end

  def create
  #  customer = current_user.stripe_customer
  @amount = 500
  customer = StripeTool.create_customer(
    email: params[:stripeEmail],
    stripe_token: params[:stripeToken]
  )


    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: @amount,
      description: 'Rails Stripe Customer',

    )

    redirect_to thanks_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect to new_currency_path
  end


  def thanks

  end

end
