class CreateBoardDocuments < ActiveRecord::Migration
  def change
    create_table :board_documents do |t|
      t.integer :project_id
      t.string :approval
      t.string :mark
      t.date :date
      t.string :location
      t.time :time

      t.timestamps
    end
  end
end
