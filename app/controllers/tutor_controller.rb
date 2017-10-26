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
    @tutor = Tutor.new
  end

  def piggy_bank
  end

  def messenger
  end

  def first_time_tutor
    @tutor = Tutor.new
  end


  def update
    @tutor = current_user
    @tutor.update_attributes(is_tutor: true)
    redirect_to tutor_index_path
  end
  def create
    @tutor = Tutor.new(params[:tutor])
    if @tutor.save
      redirect_to tutor_index_path, notice: "Successfully created Tutor."
    else
      render :new
    end
  end

end
