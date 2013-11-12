class RenameTypeOfBoardDocuments < ActiveRecord::Migration
  def up
    rename_column :board_documents, :type, :tipo
  end

  def down
  
  end
end
