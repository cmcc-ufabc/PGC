class AddAvaliationTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :avaliation_type, :boolean
  end
end
