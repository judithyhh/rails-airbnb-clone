class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :lense, foreign_key: true
      t.date :borrow_date
      t.date :return_date
      t.text :booking_comment
      t.boolean :approved_by_owner
      t.integer :rating_from_renter
      t.integer :rating_from_owner
      t.text :review_by_renter

      t.timestamps
    end
  end
end
