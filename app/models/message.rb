class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  after_create_commit { MessageBroadcastJob.perform_later(self) }   #job is run after messages is inserted into DB
                                                                    #perform_later triggers perform inside the Job
end
