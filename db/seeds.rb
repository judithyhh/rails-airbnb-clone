# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "date"

Booking.delete_all
Lense.delete_all
User.delete_all

url = ["http://res.cloudinary.com/adbeuys/image/upload/v1502864681/lens-190972_1920_x1oqog.jpg", "http://res.cloudinary.com/adbeuys/image/upload/v1502864681/Rokinon-35mm-Cine-T1.5-Lens-e1439043459276_2_org6oo.jpg"]
human_url = ["http://res.cloudinary.com/tanjamiee/image/upload/w_28,h_28,c_crop,g_face,r_max/v1502952658/IMG_2552_llmmbl.jpg", "http://res.cloudinary.com/tanjamiee/image/upload/w_28,h_28,c_crop,g_face,r_max/v1502952660/IMG_2749_c0o1df.jpg"]

20.times do
User.create(email: Faker::Internet.email, password: "123456", password_confirmation: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: Faker::Address.city, is_owner: [true, true, false].sample, remote_photo_url: human_url.sample)
p "User Created"
end


User.all.each do |owner|
  if owner.is_owner == true
    [1,2,3].sample.times do
      Lense.create(user_id: owner.id, lens_type: ["Kit", "Standard", "Prime", "Telephoto Zoom", "Macro", "Wide Angle"].sample, brand: ["Canon", "Leica", "Minolta", "Nikon", "Olympus"].sample, price: rand(30..120), condition: ["Excellent", "Good", "Usable"].sample, location: ["Chengdu", "Shanghai", "Suzhou", "Beijing", "Xinjiang", "Shenzhen", "Guangzhou"].sample, remote_photo_url: url.sample)
      p "Lens created for #{owner.first_name}"
    end
  end
end


User.all.each do |owner|
  if owner.is_owner == true
    owner.lenses.each do |lense|
      Booking.create(user_id: lense.user_id, lense_id: lense.id, borrow_date: Date.today, return_date: Date.today + 3, booking_comment: "An amazing lens", approved_by_owner: true, rating_from_renter: rand(1..5) ,rating_from_owner: rand(1..5) ,review_by_renter: "Nice contact, good quality lens")
    end
  end
end

