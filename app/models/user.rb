class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :tutoring_session, foreign_key: :user_id
  has_one :tutoring_session, foreign_key: :tutor_id

  #has_many :tutor_courses
  has_many :courses, :through => :tutor_courses

  has_many :messages
  has_many :conversations, foreign_key: :sender_id
  def stripe_customer
    if stripe_id?
      Stripe::Customer.retrieve(stripe_id)
    else
      stripe_customer = Stripe::Customer.create(email: email)
      update(stripe_id: stripe_customer.id)
      stripe_customer
  end
end
end
