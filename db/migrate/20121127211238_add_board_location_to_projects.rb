class AddBoardLocationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :board_location, :string
    add_column :projects, :boad_time, :time
    add_column :projects, :boad_invitation, :boolean
  end
end
