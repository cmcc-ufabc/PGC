class AddTrimestreToDuedates < ActiveRecord::Migration
  def change
    add_column :duedates, :trimestre, :string
  end
end
