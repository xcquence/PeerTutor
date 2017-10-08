class RoomChannel < ApplicationCable::Channel
  def subscribed                  #starts transmiting data from "room_channel" to clients
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
