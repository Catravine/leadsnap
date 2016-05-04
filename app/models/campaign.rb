class Campaign < ActiveRecord::Base
  has_many :leads

  def next_lead(source_code)
    return leads.where(killed: false, day_lead: true).first if source_code == 'day'
    leads.where(source_code: source_code, killed: false, day_lead: false).first
  end

end
