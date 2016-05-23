class Campaign < ActiveRecord::Base
  has_many :leads, dependent: :destroy

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

  def second_round_nos
    No.destroy_all
  end

end
