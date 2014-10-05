class AddDetailssssToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ethercode, :string
  end
end
