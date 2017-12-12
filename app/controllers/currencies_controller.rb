class CurrenciesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
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

  if params[:method] == 'update'
        @user = current_user
        @user.update_attributes(account_balance: @amount)
        @user.save
      else

   customer = StripeTool.create_customer(
     email: params[:stripeEmail],
     stripe_token: params[:stripeToken]
   )


     charge = StripeTool.create_charge(
       customer_id: customer.id,
       amount: @amount,
       description: 'Peer Tutor Tutee Customer',

     )

  end



   rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_currencies_path
   end

  end

  def update
    @user = current_user
    @user.update_attributes(account_balance: @amount)
    @user.save
  end

  def thanks

  end
