class Tutor < ApplicationRecord
  belongs_to :user , optional: true
  has_many :tutoring_session
  has_many :tutor_courses
  has_many :courses, :through => :tutor_courses

  scope :is_available, -> { where(is_live: true) }
end
