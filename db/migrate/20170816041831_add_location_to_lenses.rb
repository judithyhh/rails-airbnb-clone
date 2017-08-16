class AddLocationToLenses < ActiveRecord::Migration[5.0]
  def change
    add_column :lenses, :location, :text
  end
end
