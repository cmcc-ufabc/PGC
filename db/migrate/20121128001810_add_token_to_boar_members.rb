class AddTokenToBoarMembers < ActiveRecord::Migration
  def change
    add_column :board_members,:token,:string
    add_column :board_members,:confirmed,:boolean
  end
end
