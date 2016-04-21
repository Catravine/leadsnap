# Create an admin user for my primary email
caroline = User.create!(
  email: "caroline@carolinecourtney.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  approved: true,
  phone: "(317) 224-6528",
  fullname: "Caroline Courtney"
)
caroline.admin!

# Create a premium user for my secondary email
catravine = User.create!(
  email: "catravine@hotmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  approved: true,
  phone: "(317) 602-6200",
  fullname: "Catravine Blar Flabouven III"
)
catravine.manager!

# Create a main standard user
User.create!(
  email: "peebles@poobles.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  approved: true,
  phone: "(317) 555-0123",
  fullname: "Peebles V. Squeebles"
)

puts "SEED FINISHED"
puts "#{User.all.count} users created."
