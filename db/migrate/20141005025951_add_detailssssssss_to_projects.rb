class AddDetailssssssssToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pl, :float
  end
end
