class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :details
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
