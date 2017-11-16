class CreateTutorCourses < ActiveRecord::Migration[5.1]
  #Join Table between Tutor and Course
  def change
    create_table :tutor_courses do |t|
      t.belongs_to :tutor, index: true
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
