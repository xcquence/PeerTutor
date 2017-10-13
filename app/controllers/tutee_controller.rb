class TuteeController < ApplicationController

  def find_tutor
    @subject = Subject.new
    #@courses = Course.all
  end

  def tips_management
  end

  def schedule
  end

  def create
    TutoringSession.create(tutoring_session_params)
    #redirect to tutoring sessions method
  end

  def tutoring_sessions
    @tutoring_sessions = TutoringSession.all
  end

  private

  def tutoring_session_params
    params.require(:tutoring_session).permit(:course, :question)
  end
end
