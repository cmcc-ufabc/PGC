class AddGroupstateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :groupstate, :boolean
  end
end
