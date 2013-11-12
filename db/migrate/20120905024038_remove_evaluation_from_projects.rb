class RemoveEvaluationFromProjects < ActiveRecord::Migration
  def up
    
      remove_column :projects, :evaluation_id
  end

  def down
    
    add_column :projects, :evaluation_id, :integer
  end
end
