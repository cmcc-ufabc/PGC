class AddProjectIdToEvaluations < ActiveRecord::Migration
  def up
    add_column :evaluations, :project_id, :integer
  end
  
  def down
    remove_column :evaluations, :project_id
  end
end
