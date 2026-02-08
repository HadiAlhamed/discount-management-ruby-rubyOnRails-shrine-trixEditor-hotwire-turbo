puts "Cleaning database..."
Discount.destroy_all

puts "Creating seeds..."

image_file = File.open(Rails.root.join('test/fixtures/files/rails.png'))

Discount.create!(
  title: "Grand Opening Discount",
  email: "marketing@partner.com",
  description: "This is a seeded discount with a real attached image.",
  expiration_date: Date.today + 45.days, 
  image: image_file 
)

puts "Seed complete! 1 Discount created with image."