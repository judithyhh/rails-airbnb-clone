class RemovePriceFromLenses < ActiveRecord::Migration[5.0]
  def change
    remove_column :lenses, :price, :text
  end
end
