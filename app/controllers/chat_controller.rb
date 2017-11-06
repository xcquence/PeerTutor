class ChatController < ApplicationController
  def index
    session[:conversations] ||= []


    tutoring_session = TutoringSession.where(user_id: current_user.id).or(TutoringSession.where(tutor_id: current_user.id)).last


    unless tutoring_session.nil?
      @conversations = []
      @users = User.all.where(id: tutoring_session.user_id).or(User.all.where(id: tutoring_session.tutor_id)).where.not(id: current_user)                 #select all users that are not us
      @conversations << Conversation.includes(:recipient, :messages)
                                   .find_by(id: session[:conversations])
    end
  end
end
