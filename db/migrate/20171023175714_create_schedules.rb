class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.date :startdate
      t.date :enddate
      t.time :starttime
      t.time :endtime

    end
  end
end
