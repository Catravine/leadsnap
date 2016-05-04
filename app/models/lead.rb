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

  def kill_lead
    self.killed = true
    self.save!
  end

  def mark_as_day
    self.day_lead = true
    self.save!
  end

end
