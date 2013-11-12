class ChangeAuthorIntegerToStringOnNotifications < ActiveRecord::Migration
  def up
     change_column :notifications, :author, :string
  end

  def down
    change_column :notificationss, :author, :integer
  end
end
