class TutorController < ApplicationController

  before_action :authenticate_user!   ## User has to be logged in

  def index
    #check if user is a tutor
    unless current_user.is_tutor
      redirect_to tutor_first_time_tutor_path
    end
  end

  def incoming_requests
    @sessions = TutoringSession.where(tutor_id: current_user.id, accepted: false)
  end

  def request_accepted
    @session = TutoringSession.find(params[:id])
    @session.update(accepted: true)
    redirect_to tutor_currently_tutoring_path
  end

  def currently_tutoring
    @sessions = TutoringSession.where(tutor_id: current_user.id, accepted: true)
  end

  def tutor_profile
  end

  def piggy_bank
  end

  def messenger
  end

  def first_time_tutor
  end

  def create

  end
  def update
    @tutor = current_user
    @tutor.update_attributes(is_tutor: true)
    redirect_to tutor_index_path
  end

end
