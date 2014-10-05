class AddDjToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ethid, :string
  end
end
