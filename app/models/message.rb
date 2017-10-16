class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  #will be called after message is saved into db
  after_create_commit { MessageBroadcastJob.perform_later(self) }     #perform method will be called inside message_broadcast_job
end
