class AddAdminToEntrepreneur < ActiveRecord::Migration
  def change
    add_column :entrepreneurs, :admin, :boolean
  end
end
