class CreateBrandsAndStores < ActiveRecord::Migration[5.2]
  def change
    create_table(:brands) do |t|
      t.column(:shoe_brand, :string)
      t.column(:price, :float)

      t.timestamp
    end

    create_table(:stores) do |t|
      t.column(:store, :string)

      t.timestamp
    end

    create_table(:brands_stores) do |t|
      t.column(:brands_id, :integer)
      t.column(:stores_id, :integer)

      t.timestamp
    end
  end
end
