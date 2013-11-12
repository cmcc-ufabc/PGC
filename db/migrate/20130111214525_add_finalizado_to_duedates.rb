class AddFinalizadoToDuedates < ActiveRecord::Migration
  def change
    add_column :duedates, :finalizado, :boolean
  end
end
