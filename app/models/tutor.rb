class Tutor < ApplicationRecord
  belongs_to :user
  has_many :tutoring_session
  has_many :subject
  has_one :schedule
  scope :is_available, -> { where(is_live: true) }
end
