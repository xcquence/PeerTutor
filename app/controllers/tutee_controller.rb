class TuteeController < ApplicationController

  #new
  def find_tutor
    @subject = Subject.new
    #@courses = Course.all
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

    redirect_to '/tutee/tutoring_sessions'
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
