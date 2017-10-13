class ConversationChannel < ApplicationCable::Channel

  #only a group of people will get the results of the method
  def subscribed      #adds user to a channel
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
  end
end


#this file is responsive for performing our edits on the back-end, while the javascript file listens on the front-end.
