require 'csv'

namespace :import do

  desc "Import Leads from csv"
  task leads: :environment do
    filename = File.join Rails.root, "test.csv"
    counter = 0
    CSV.foreach(filename, headers: true, header_converters: :symbol) do |row|
      lead = Lead.where(account: row[:account]).first_or_initialize
      lead.assign_attributes row.to_hash.slice(:name1, :name2,
        :address1, :address2, :city, :state, :zip, :phone1, :phone2,
        :phone3, :source_code)
      if lead.save
        counter += 1
      else
        puts "#{name1} - #{lead.errors.full_messages.join(",")}" if lead.errors.any?
      end
    end
    puts "#{counter} leads created."
  end
end
