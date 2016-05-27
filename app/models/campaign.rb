class Campaign < ActiveRecord::Base
  has_many :leads, dependent: :destroy

  # Default order alpha by name
  default_scope { order("campaigns.name ASC") }

  def sources
    Lead.where(campaign_id: self).pluck(:source_code).uniq
  end

  def next_lead(current_lead)
    if current_lead.recall
      recall_user = current_lead.recall.user
      user_callbacks = Recall.where(user: recall_user).map { |cb| cb.lead }
      user_callbacks.sort_by! { |l| l.last_dialed }
      user_callbacks.first

    elsif current_lead.day_lead?
      self.leads.unreached.valid.day_leads.first
    else
      self.leads.unreached.valid.by_source(current_lead.source_code).first
    end
  end

  # Run at the start of a new round for a particular campaign
  def second_round_nos
    count = 0
    No.all.each do |no|
      if self.leads.include?(no.lead) && no.date < Time.now - self.days_old_nos.days
        no.destroy
        count += 1
      end
    end
    count
  end

end
