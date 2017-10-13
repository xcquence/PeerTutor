class ConversationChannel < ApplicationCable::Channel

  #only a group of people will get the results of the method
  def subscribed      #adds user to a channel
    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def speak(data)
    message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end

    Message.create(message_params) #insert message object sent from front end into db
  end
end


#this file is responsive for performing our edits on the back-end, while the javascript file listens on the front-end.
