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
    # @tutoring_session.course_id = params[:course][:id]
    # @tutoring_session.question = params[:tutoring_session][:question]
    # @tutoring_session.user_id = params[:tutoring_session][:user_id]
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

=begin
Parameters: {"utf8"=>"✓", "authenticity_token"=>"nqIptsvDjNzlg/mtXXMwYGRUV4zX310V5QMjkgZkcdUtS9UgK87v6QL8bvcUpiPeDfueohu0Vay4kV1pSJxbkg==",
"subject"=>{"id"=>"1"},
"course"=>{"id"=>"1"},
"tutoring_session"=>{"question"=>"What?", "user_id"=>"2"},
"commit"=>"Submit"}


 params.require(:person).permit(:name, :age, pets_attributes: [ :id, :name, :category ])
=end

  def tutoring_session_params
    params.require(:tutoring_session).permit(
      :question, :user_id,
      course: [:id]
    )
  end
end
