module CampaignsHelper

  def all_leads(campaign, *code)
    return Lead.where(campaign_id: campaign, source_code: code) if code.present?
    Lead.where(campaign_id: campaign)
  end

  def all_valid_leads(campaign, *code)
    return all_leads(campaign, code).where(killed: false, disonnected: false, day_lead: false) if code.present?
    all_leads(campaign).where(killed: false, disconnected: false, day_lead: false)
  end

  def all_day_leads(campaign)
    all_leads(campaign).where(day_lead: true, killed: false, disconnected: false)
  end

  def amt_day_leads(campaign)
    all_day_leads(campaign).count
  end

  def amt_leads(campaign, *code)
    return all_valid_leads(campaign).where(source_code: code).count if code.present?
    all_valid_leads(campaign).count
  end

  def sources(campaign)
    Lead.where(campaign_id: campaign.id).pluck(:source_code).uniq
  end

end
