require 'csv'

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
  name: "Indianapolis Symphony Orchestra",
  year: "2016",
  code: "42",
  callback_phone: "(317) 667-0473",
  notes: "Pay-it-forward offer includes any remaining 15/16 series concert (except Carmina Burana).",
  available: true
)

Campaign.create!(
  name: "Symphony on the Prairie - Sample",
  year: "2015",
  code: "42",
  callback_phone: "(317) 667-0473",
  notes: "April 17: our value pak price is now $190.",
  available: true
)

# Seed some leads to the SotP Sample campaign from csv file
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'sotp_sample_seed.csv'))
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   l = Lead.new
#   l.account = row['account']
#   l.name1 = row['name1']
#   l.name2 = row['name2']
#   l.address1 = row['address1']
#   l.address2 = row['address2']
#   l.city = row['city']
#   l.state = row['state']
#   l.zip = row['zip']
#   l.phone1 = row['phone1']
#   l.phone2 = row['phone2']
#   l.phone3 = row['phone3']
#   l.source_code = row['source']
#   l.campaign_id = 2
#   l.save
#   puts "#{l.name1} saved."
# end

puts "SEED FINISHED"
puts "#{User.all.count} users created."
puts "#{Campaign.all.count} campaigns created."
puts "#{Lead.all.count} leads created."
