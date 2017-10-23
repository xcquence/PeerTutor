class Tutor < ApplicationRecord
  belongs_to :user
  has_many :tutoring_session

  scope :is_available, -> { where(is_live: true) }
end
