class AddAtaConfirmToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ata_confirm, :boolean
  end
end
