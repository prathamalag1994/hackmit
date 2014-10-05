class AddDetailssssssToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :target, :float
  end
end
