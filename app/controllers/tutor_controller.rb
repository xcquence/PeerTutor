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
    @firstname = current_user.first_name
    @lastname = current_user.last_name
    
  end

  def piggy_bank
  end

  def messenger
  end

  def first_time_tutor
    @temp = "I will be avalable in first_time_tutor.html.erb"
  end

  def update
    @tutor = current_user
    @tutor.update_attributes(is_tutor: true)
    redirect_to tutor_index_path
  end

end
