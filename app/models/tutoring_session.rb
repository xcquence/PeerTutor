class TutoringSession < ApplicationRecord
  belongs_to :course
  belongs_to :user
  #belongs_to :tutor    #has not created tutor model

  belongs_to :user, foreign_key: :user_id, class_name: User
  belongs_to :tutor, foreign_key: :tutor_id, class_name: User

  validates :user_id, uniquness: { scope: :tutor_id }
end
