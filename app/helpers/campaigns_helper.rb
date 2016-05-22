module CampaignsHelper

  def all_leads(campaign, code=nil)
    unreached_leads = Lead.where.not(:id => Recall.select(:lead_id))
    unreached_leads = unreached_leads.where.not(:id => Sale.select(:lead_id))
    unreached_leads = unreached_leads.where.not(:id => No.select(:lead_id))
    return unreached_leads.where(campaign_id: campaign, source_code: code) if code
    unreached_leads.where(campaign_id: campaign)
  end

  def all_valid_leads(campaign, code=nil)
    return all_leads(campaign, code).where(killed: false, disonnected: false, day_lead: false) if code
    all_leads(campaign).where(killed: false, disconnected: false, day_lead: false)
  end

  def all_day_leads(campaign)
    all_leads(campaign).where(day_lead: true, killed: false, disconnected: false)
  end

  def amt_day_leads(campaign)
    all_day_leads(campaign).count
  end

  def amt_leads(campaign, code=nil)
    return all_valid_leads(campaign).where(source_code: code).count if code
    all_valid_leads(campaign).count
  end

  def sources(campaign)
    Lead.where(campaign_id: campaign.id).pluck(:source_code).uniq
  end

  def csv_download_path(campaign)
    "#{campaign.id}/leads.csv"
  end

end
