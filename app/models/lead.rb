class Lead < ActiveRecord::Base
  belongs_to :campaign

  default_scope { order("leads.last_dialed ASC") }
  #scope :in_campaign, ->(campaign) { where("leads.campaign.id == ?" campaign) if campaign.present?}

  def campaign_name
    Campaign.find_by(id: campaign_id).name
  end

  def campaign_notes
    Campaign.find_by(id: campaign_id).notes
  end

  def campaign_code
    Campaign.find_by(id: campaign_id).code
  end

  def campaign_phone
    Campaign.find_by(id: campaign_id).callback_phone
  end

  def dial_lead
    self.dial_count += 1
    self.last_dialed = Time.now
    self.save!
  end

end
