class AddProjectIdToBoardMembers < ActiveRecord::Migration
  def change
    add_column :board_members, :project_id, :integer
  end
end
