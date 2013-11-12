class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.boolean :confirmed
      t.string :token

      t.timestamps
    end
  end
end
