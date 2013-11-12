class AddGroupConfirmToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :group_confirm, :boolean, :default => 0
  end
end
