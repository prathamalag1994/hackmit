class AddDetailssToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :min, :float
  end
end
