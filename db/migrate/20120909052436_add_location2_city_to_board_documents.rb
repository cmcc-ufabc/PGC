class AddLocation2CityToBoardDocuments < ActiveRecord::Migration
  def up
    
    add_column :board_documents, :location2, :string
    add_column :board_documents, :city, :string
  end
  
  def down
    
     remove_column :board_documents, :location2
     remove_column :board_documents, :city
    
  end
end
