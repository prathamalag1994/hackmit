class AddDetailsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :title, :string
    add_column :projects, :desc, :string
    add_column :projects, :exp, :date
    add_column :projects, :backed, :integer
    add_column :projects, :roll, :date
  end
end
