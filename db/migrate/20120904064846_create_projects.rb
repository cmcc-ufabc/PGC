class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :aluno_id
      t.integer :orientador_id
      t.string :title
      t.string :description
      t.string :course
      t.integer :status
      t.string :pdf
      t.integer :evaluation_id
      t.integer :board_id

      t.timestamps
    end
  end
end
