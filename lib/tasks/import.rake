namespace :import do

  desc "Import Leads from csv"
  task leads: :environment do
    filename = File.join Rails.root, "test.csv"
    counter = 0
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      lead = Lead.assign_from_row(row)
      if lead.save
        counter += 1
      else
        puts "#{lead.account} - #{lead.errors.full_messages.join(",")}" if lead.errors.any?
      end
    end
    puts "#{counter} leads created."
  end
end
