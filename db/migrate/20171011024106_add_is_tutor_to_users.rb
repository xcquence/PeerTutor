class AddIsTutorToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_tutor, :boolean
  end
end
