class TutorController < ApplicationController

  def index
    #check if user is a tutor
    unless current_user.is_tutor
      redirect_to tutor_first_time_tutor_path
    end
  end

  def incoming_requests
  end

  def currently_tutoring
  end

  def tutor_profile
  end

  def piggy_bank
  end

  def messenger
  end

  def toggle_is_live
    @tutor = Tutor.where(user_id: current_user.id).take
    if @tutor.is_live
      @tutor.update_attribute(:is_live, false)
      redirect_to tutor_is_live_path
    else
      @tutor.update_attribute(:is_live, true)
      redirect_to tutor_incoming_requests_path
    end
  end

  def first_time_tutor
    if current_user.is_tutor
      redirect_to tutor_index_path
    end
  end

  def update
    ##creates a new tutor record
    @new_tutor = Tutor.new(:user_id => current_user.id)
    @new_tutor.save
    ##udates the user's is_tutor
    @user = current_user
    @user.update_attribute(:is_tutor, true)
    redirect_to tutor_index_path
  end

end
