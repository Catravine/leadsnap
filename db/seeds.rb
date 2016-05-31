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

# Create a guest admin for people to see tour the functionality
guest_admin = User.create!(
  email: "admin@example.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  approved: true,
  phone: "(317) 555-0120",
  fullname: "Guest Admin"
)
guest_admin.admin!

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
  name: "Naptown Symphony",
  year: "2016",
  code: "42",
  callback_phone: "(317) 555-1234",
  notes: "Buy a Pops subscription, get a free Magic of Christmas ticket, until July 31",
  available: true
)

Campaign.create!(
  name: "Naptown Summertime Sounds in the Hills",
  year: "2016",
  code: "42",
  callback_phone: "(317) 555-1234",
  notes: "May 17: our value pak price is now $190.",
  available: true
)

Campaign.create!(
  name: "Naptown Ballet",
  year: "2016",
  code: "52",
  callback_phone: "(317) 555-9999",
  notes: "May 21: 15-16 season is over, so just sell discounted 16-17 packs",
  available: true
)

# Seed some leads Leads with Faker data for these various campaigns
3000.times do
  Lead.create!(
    account: Faker::Number.number(7),
    name1: Faker::Name.name,
    name2: Random.rand(10) == 0 ? Faker::Name.name : nil,
    address1: Faker::Address.street_address,
    address2: Random.rand(5) == 0 ? Faker::Address.secondary_address : nil,
    city: Faker::Address.street_name,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip,
    phone1: Faker::PhoneNumber.phone_number,
    phone2: Random.rand(3) == 0 ? Faker::PhoneNumber.phone_number : nil,
    phone3: Random.rand(6) == 0 ? Faker::PhoneNumber.phone_number : nil,
    source_code: ["dance", "pops", "masterworks", "jazz", "theatre", "world"].sample,
    campaign_id: Campaign.all.sample.id
  )
end

puts "SEED FINISHED"
puts "#{User.all.count} users created."
puts "#{Campaign.all.count} campaigns created."
puts "#{Lead.all.count} leads created."
