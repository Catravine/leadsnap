class Campaign < ActiveRecord::Base
  has_many :leads

  def next_lead(source_code)
    leads.where(source_code: source_code, killed: false, day_lead: false).first
  end

end
