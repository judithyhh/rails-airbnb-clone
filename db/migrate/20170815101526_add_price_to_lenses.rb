class AddPriceToLenses < ActiveRecord::Migration[5.0]
  def change
    add_column :lenses, :price, :float
  end
end
