class AddDefaultValueToIsTutor < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :is_tutor, :boolean, default: false
  end
end
