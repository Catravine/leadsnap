class Campaign < ActiveRecord::Base
  has_many :leads, dependent: :destroy

  def next_lead(current_lead)
    unreachead_leads = leads.where(killed: false, disconnected: false)
    if current_lead.recall
      recall_user = current_lead.recall.user
      user_callbacks = Recall.where(user: recall_user).map { |cb| cb.lead }
      user_callbacks.sort_by! { |l| l.last_dialed }
      user_callbacks.first

    elsif current_lead.day_lead?
      unreachead_leads.where(day_lead: true).find { |l| l.recall.nil? }
    else
      unreachead_leads.where(source_code: current_lead.source_code).find { |l| l.recall.nil? }
    end
  end

end
