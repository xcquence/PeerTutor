class TutorController < ApplicationController

  def index
    #check if first time tutor
    @user = current_user
    unless @user.is_tutor
      redirect_to edit_user_registration_path
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
end
