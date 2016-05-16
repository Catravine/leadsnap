require 'csv'

namespace :import do

  desc "Import Leads from csv"
  task leads: :environment do
    filename = File.join Rails.root, "test.csv"
    counter = 0
    CSV.foreach(filename, headers: true) do |row|
      lead = Lead.create(
        account: row["account"],
        name1: row["name1"],
        name2: row["name2"],
        address1: row["address1"],
        address2: row["address2"],
        city: row["city"],
        state: row["state"],
        zip: row["zip"],
        phone1: row["phone1"],
        phone2: row["phone2"],
        phone3: row["phone3"],
        source_code: row["source_code"],
        campaign_id: 1
      )
      puts "#{name1} - #{lead.errors.full_messages.join(",")}" if lead.errors.any?
      counter += 1 if lead.persisted?
    end
    puts "#{counter} leads created."
  end
end
