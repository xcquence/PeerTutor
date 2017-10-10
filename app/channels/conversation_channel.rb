class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations-#{current_user.id}"   #We want to create a unique channel for each user.
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end


  #Speak method builds a hash that’s based on a passed data and sends data to the front-end
  #using the ActionCable.server.broadcast method to the specified channel.
  #Data sent from this method is visible in the received method on the front-end.
  def speak(data)
    message_params = data['message'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end

    ActionCable.server.broadcast(
      "conversations-#{current_user.id}",
      message: message_params
    )
  end



end
