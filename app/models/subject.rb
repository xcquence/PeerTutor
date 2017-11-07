class Subject < ApplicationRecord
  has_many :courses
  belongs_to :tutor, optional: true
  def abbrev_and_name
    self.abbrev + ' - ' + self.name
  end
end
