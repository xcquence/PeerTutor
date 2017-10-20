class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects, id: false do |t|
      ##added id
      t.integer :id
      t.string :abbrev
      t.string :name


    end
  end
end
