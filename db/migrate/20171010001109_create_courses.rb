class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses, id: false do |t|
      t.string :subject_id
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
