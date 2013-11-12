class AddBoardDateToProjects < ActiveRecord::Migration
  def up
    
     add_column :projects, :board_date, :date
  end
  
  def down
    
    remove_column :projects, :board_date
  end
end
