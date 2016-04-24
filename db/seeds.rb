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

# Create some campaigns
Campaign.create!(
  name: "Indianapolis Symphony Orchestra",
  year: "2016",
  code: "42",
  callback_phone: "(317) 667-0473",
  notes: "Pay-it-forward offer includes any remaining 15/16 series
    concert (except Carmina Burana)."
)

Campaign.create!(
  name: "Symphony on the Prairie",
  year: "2016",
  code: "42",
  callback_phone: "(317) 667-0473",
  notes: "April 17: our value pak price is now $190."
)

puts "SEED FINISHED"
puts "#{User.all.count} users created."
puts "#{Campaign.all.count} campaigns created."
