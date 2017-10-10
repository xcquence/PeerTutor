class ConversationsController < ApplicationController
  def create              #get a conversation between a current user and requested user
    @conversation = Conversation.get(current_user.id, params[:user_id])

    # If in the session there is no added conversation_id yet,
    #we’ll add it, if not, we’ll just respond with a js file.
    add_to_conversations unless conversated?

    respond_to do |format|
      format.js
    end
  end

  def close       #It removes the requested converastion_id from the session and closes a window on the front-end
    @conversation = Conversation.find(params[:id])

    session[:conversations].delete(@conversation.id)

    respond_to do |format|
      format.js
    end
  end

  private

  def add_to_conversations
    session[:conversations] ||= []
    session[:conversations] << @conversation.id
  end

  def conversated?
    session[:conversations].include?(@conversation.id)
  end
end
