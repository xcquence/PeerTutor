class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses, id: false do |t|
      t.integer :subject_id
      t.string :name
      t.string :number


    end
  end
end
