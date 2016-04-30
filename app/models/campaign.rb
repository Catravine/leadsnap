class Campaign < ActiveRecord::Base
  has_many :leads

  def next_lead(source_code)
    leads.where(source_code: source_code).first
  end

end
