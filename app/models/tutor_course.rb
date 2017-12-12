class TutorCourse < ApplicationRecord
<<<<<<< HEAD
  belongs_to :tutor
=======
  belongs_to :user, foreign_key: 'tutor_id'
>>>>>>> master
  belongs_to :course
end
