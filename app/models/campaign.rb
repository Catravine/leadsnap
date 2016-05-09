class Campaign < ActiveRecord::Base
  has_many :leads, dependent: :destroy

  def next_lead(current_lead)
    return leads.where(killed: false, day_lead: true, disconnected: false).first if current_lead.day_lead?
    leads.where(killed: false, day_lead: false, disconnected: false, source_code: current_lead.source_code).first
  end

end
