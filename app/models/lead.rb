class Lead < ActiveRecord::Base
  belongs_to :campaign

  default_scope { order("leads.last_dialed ASC") }

  #scope :in_campaign, ->(campaign) { where("leads.campaign.id == ?" campaign) if campaign.present?}

  delegate :name, to: :campaign, prefix: true 
  delegate :notes, to: :campaign, prefix: true 
  delegate :code, to: :campaign, prefix: true 
  delegate :callback_phone, to: :campaign, prefix: true 


  def dial_lead
    self.dial_count += 1
    self.last_dialed = Time.now
    self.save!
  end

end
