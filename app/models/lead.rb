class Lead < ActiveRecord::Base

  def campaign_name
    Campaign.find_by(id: self.campaign_id).name
  end

  def campaign_notes
    Campaign.find_by(id: self.campaign_id).notes
  end

  def campaign_code
    Campaign.find_by(id: self.campaign_id).code
  end

  def campaign_phone
    Campaign.find_by(id: self.campaign_id).callback_phone
  end

end
