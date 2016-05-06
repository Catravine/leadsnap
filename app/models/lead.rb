class Lead < ActiveRecord::Base
  belongs_to :campaign

  default_scope { order("leads.last_dialed ASC") }

  delegate :name, to: :campaign, prefix: true
  delegate :notes, to: :campaign, prefix: true
  delegate :code, to: :campaign, prefix: true
  delegate :callback_phone, to: :campaign, prefix: true

  def dial_lead
    self.dial_count += 1
    self.last_dialed = Time.now
    self.save!
  end

  def disconnect_check
    if (phone1 == nil or phone1[0] == 'd') && (phone2 == nil or phone2[0] == 'd') && (phone3 == nil or phone3[0] == 'd')
      self.disconnected = true
      self.save!
    end
  end

end
