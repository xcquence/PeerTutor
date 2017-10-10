class TuteeController < ApplicationController

  def find_tutor
    @subjects = Subject.all
    @courses = Course.all
  end

  def tips_management
  end

  def schedule
  end

  private

  def tutoring_session_params
    params.require(:tutoring_session).permit(:course, :question)
  end
end
