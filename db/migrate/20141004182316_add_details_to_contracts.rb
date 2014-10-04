class AddDetailsToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :custid, :string
    add_column :contracts, :projid, :string
    add_column :contracts, :tx, :string
  end
end
