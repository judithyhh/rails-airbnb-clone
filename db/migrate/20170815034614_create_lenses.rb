class CreateLenses < ActiveRecord::Migration[5.0]
  def change
    create_table :lenses do |t|
      t.references :user, foreign_key: true
      t.text :lens_type
      t.text :brand
      t.text :price
      t.text :condition

      t.timestamps
    end
  end
end
