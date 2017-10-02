class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) } #ensure that the messages for display appear with most-recent last
                                                         #(at the bottom of the chat) and a maximum of 50.
end
