class TutorController < ApplicationController

  before_action :authenticate_user!   ## User has to be logged in

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
    @tutors = Tutor.create(params[:tutor])

      redirect_to tutor_index_path, notice: "Successfully created Tutor."

  
  end

  def create
    @tutor = Tutor.create(params[:tutor])
    if @tutor.save
      redirect_to first_time_tutor_path, notice: "Successfully created Tutor."
    else
      render :new
    end

  end
  def new
    @tutor = Tutor.new
    @education = Tutor.new(education)
    @experience = Tutor.new(experience)

  end

end
