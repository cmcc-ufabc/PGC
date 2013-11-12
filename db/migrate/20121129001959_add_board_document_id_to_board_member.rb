class AddBoardDocumentIdToBoardMember < ActiveRecord::Migration
  def change
    add_column :board_members, :board_document_id, :integer
  end
end
