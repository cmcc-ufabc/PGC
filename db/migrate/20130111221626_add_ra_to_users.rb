class AddRaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ra, :integer
  end
end
