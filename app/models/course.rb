class Course < ApplicationRecord
  belongs_to :subject
  has_many :tutoring_sessions

  has_many :tutor_courses
  has_many :users, :through => :tutor_courses

end
