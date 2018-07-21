class UpdatePrecisionOfPriceForBrands < ActiveRecord::Migration[5.2]
  def change
    change_column :brands, :price, :decimal, :precision => 20, :scale => 2
  end
end
