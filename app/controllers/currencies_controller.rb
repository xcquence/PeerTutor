class CurrenciesController < ApplicationController
  before_action :authenticate_user!


  def new
  end

  def create
  #  customer = current_user.stripe_customer
  @amount = params[:amount]
  @amount = @amount.gsub('$', '').gsub(',', '')

  begin
   @amount = Float(@amount).round(2)
 rescue
   flash[:error] = 'Charge cannot be completed. Please enter a valid amount in USD ($).'
   redirect_to new_currencies_path
   return
 end

 @amount = (@amount * 100).to_i # Must be an integer!

 if @amount < 500
   flash[:error] = 'Charge cannot be completed. Payment amount must be at least $5.'
   redirect_to new_currencies_path
   return
 end


  customer = StripeTool.create_customer(
    email: params[:stripeEmail],
    stripe_token: params[:stripeToken]
  )


    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: @amount,
      description: 'Peer Tutor Tutee Customer',

    )





  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_currencies_path
  end

  @acc_balance = User.find(params[:account_balance])

  @spending_total = @acc_balance + @amount




  end




  def thanks

  end
