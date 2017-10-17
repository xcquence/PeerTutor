class Course < ApplicationRecord
  belongs_to :subject, optional: true
  has_many :tutoring_sessions

end
