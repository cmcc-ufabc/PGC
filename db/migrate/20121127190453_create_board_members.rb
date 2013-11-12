class CreateBoardMembers < ActiveRecord::Migration
  def change
    create_table :board_members do |t|
      t.string :nome
      t.string :email
      t.string :instituicao
      t.string :tipo

      t.timestamps
    end
  end
end
