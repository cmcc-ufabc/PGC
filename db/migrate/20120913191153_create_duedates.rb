class CreateDuedates < ActiveRecord::Migration
  def change
    create_table :duedates do |t|
      t.date :orientation_start
      t.date :orientation_end
      t.date :evaluation_start
      t.date :evaluation_end
      t.date :board_start
      t.date :board_end

      t.timestamps
    end
  end
end
