class AddTerminadoToDuedates < ActiveRecord::Migration
  def change
    add_column :duedates, :terminado, :boolean
  end
end
