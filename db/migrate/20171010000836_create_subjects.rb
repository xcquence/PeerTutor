class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
<<<<<<< HEAD
    create_table :subjects  do |t|

=======
    create_table :subjects do |t|
>>>>>>> 417792181ef2deb4d970d85676eeb7d5da185530
      t.string :abbrev
      t.string :name

      t.timestamps
    end
  end
end
