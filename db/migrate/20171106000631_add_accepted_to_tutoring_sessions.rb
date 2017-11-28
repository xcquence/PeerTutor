class AddAcceptedToTutoringSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :tutoring_sessions, :accepted, :bool, default: false
  end
end
