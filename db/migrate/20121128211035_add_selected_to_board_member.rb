class AddSelectedToBoardMember < ActiveRecord::Migration
  def change
    add_column :board_members, :selected, :boolean
  end
end
