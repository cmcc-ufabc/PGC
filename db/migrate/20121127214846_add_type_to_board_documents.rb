class AddTypeToBoardDocuments < ActiveRecord::Migration
  def change
    add_column :board_documents, :type, :string
  end
end
