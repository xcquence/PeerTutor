class BankAccountsController < ApplicationController

  def new
    @tutor.user_id = current_user.id

  end

  def create

    tutor = Tutor.where(user_id: current_user.id )
    # @amount_to_deduct = params[:amount]
    # @amount_to_deduct = @amount_to_deduct.gsub('$', '').gsub(',', '')
    @current_balance = tutor.total_tip



    end
end
