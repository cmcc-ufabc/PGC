class AddDuedateIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :duedate_id, :integer
  end
end
