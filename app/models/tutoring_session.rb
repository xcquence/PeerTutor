class TutoringSession < ApplicationRecord
  belongs_to :course

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :user, optional: { foreign_key: 'tutor_id' }

  validates :user_id, uniqueness: { scope: :tutor_id }
end
