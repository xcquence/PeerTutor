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

  def first_time_tutor
    @temp = "I will be avalable in first_time_tutor.html.erb"
  end

  def register_tutor
    @tutor = User.find(params[:id])
    @ptutor.update_attributes(is_tutor: true)
    redirect_to index_path
  end

end
