class Course < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :tutoring_sessions

  has_many :tutor_courses
  has_many :tutors, :through => :tutor_courses

end
