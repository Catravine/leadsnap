namespace :second_round do

  desc "Puts leads that have said 'no' more than a specified time ago back
  into circulation by deleting their 'no' instances."

  task expired_nos: :environment do
    No.all.each do |no|
      if no.date < Time.now - no.lead.campaign.days_old_nos.days
        no.destroy unless no.lead.campaign.round < no.lead.round
      end
    end
  end

end
