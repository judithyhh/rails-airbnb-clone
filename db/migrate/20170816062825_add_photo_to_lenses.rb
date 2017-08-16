class AddPhotoToLenses < ActiveRecord::Migration[5.0]
  def change
    add_column :lenses, :photo, :string
  end
end
