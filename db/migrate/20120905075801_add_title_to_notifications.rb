class AddTitleToNotifications < ActiveRecord::Migration
  def up
    
    add_column :notifications, :title, :string
  end
  
    def down

    remove_column :notifications, :title
  end
end
