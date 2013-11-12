class AddObservationToProjects < ActiveRecord::Migration
  def up
      add_column :projects, :observation, :string
  end
  
  def down
      remove_column :projects, :observation
  end
end
