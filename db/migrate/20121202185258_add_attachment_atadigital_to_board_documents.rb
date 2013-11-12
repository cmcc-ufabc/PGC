class AddAttachmentAtadigitalToBoardDocuments < ActiveRecord::Migration
  def self.up
    change_table :board_documents do |t|
      t.has_attached_file :atadigital
    end
  end

  def self.down
    drop_attached_file :board_documents, :atadigital
  end
end
