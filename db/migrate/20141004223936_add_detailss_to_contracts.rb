class AddDetailssToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :back, :float
  end
end
