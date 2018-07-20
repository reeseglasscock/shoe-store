class UpdateBrandsStoresJoinTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :brands_stores
    create_join_table :brands, :stores
  end
end
