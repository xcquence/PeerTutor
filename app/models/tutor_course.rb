class TutorCourse < ApplicationRecord
  belongs_to :user, foreign_key: 'tutor_id'
  belongs_to :course
end
