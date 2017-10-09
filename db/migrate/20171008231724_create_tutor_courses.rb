class CreateTutorCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :tutor_courses do |t|
      t.integer :tutor_id
      t.integer :course_id
      


      t.timestamps
    end
  end
end
