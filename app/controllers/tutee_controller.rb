class TuteeController < ApplicationController

  before_action :authenticate_user!   ## User has to be logged in

  #new
  def find_tutor
    @tutoring_session = TutoringSession.where(user_id: current_user.id).last

    if @tutoring_session.nil? || @tutoring_session.tutor_id.nil?
      @subject = Subject.new
      respond_to do |format|
        format.js {render "find_tutor"}
      end
      #@courses = Course.all
    elsif @tutoring_session.accepted
      @tutor = User.find(@tutoring_session.tutor_id)
      render 'being_tutored', locals: { tutoring_session: @tutoring_session, tutor: @tutor}
    else
      @tutor = User.find(@tutoring_session.tutor_id)
      render 'pick_tutor', locals: { tutor: @tutor}
    end

  end

  def get_courses
    render partial: 'select_course', locals: {subject_id: params[:subject_id]}
  end

  #create
  def create
    TutoringSession.create(tutoring_session_params)

    # @tutoring_session = TutoringSession.new
    # @tutoring_session.course = Course.find(params[:course][:id])
    # @tutoring_session.question = params[:tutoring_session][:question]
    # @tutoring_session.user = User.find(current_user.id)
    # @tutoring_session.save()


    #  tutors = User.where(is_tutor: true).id
    #  tutors.each do

    redirect_to '/tutee/list_of_tutors'
  end

  def cancel_tutoring_session
    TutoringSession.where(user_id: current_user.id).last.destroy!
    render 'find_tutor'
  end

  def list_of_tutors
    @tutors = User.all
  end

  def pick_tutor
    @tutor = User.find(params[:tutor_id])
    TutoringSession.where(user_id: current_user.id).last.update(tutor_id: @tutor.id)
  end


  def tips_management
  end

  def schedule
  end

  def tutoring_sessions
    @tutoring_sessions = TutoringSession.all
  end

  private
  #Strong Parameter
  def tutoring_session_params
    params.require(:tutoring_session).permit(:question).merge(
      user: User.find(current_user.id),
      course: Course.find(params[:course][:id])
    )
  end

end
