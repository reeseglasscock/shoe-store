class ChangePriceToAFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :brands, :price, :float, :precision => 8, :scale => 2
  end
end
