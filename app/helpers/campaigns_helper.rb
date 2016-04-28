module CampaignsHelper

  def all_leads(campaign, *code)
    return Lead.where(campaign_id: campaign, source_code: code) if code.present?
    Lead.where(campaign_id: campaign)
  end

  def amt_leads(campaign, *code)
    return all_leads(campaign).where(source_code: code).count if code.present?
    all_leads(campaign).count
  end

  def sources(campaign)
    Lead.where(campaign_id: campaign.id).uniq.pluck(:source_code)
  end

  def lead_breakdown(campaign)
    list_items = String.new
    sources =
    Lead.where(campaign_id: campaign.id).uniq.pluck(:source_code)
    sources.each do |code|
      lead_count = Lead.where(campaign_id: campaign.id, source_code: code).count
      list_items << "<li>#{code}: #{lead_count}</li>"
    end
    list_items.html_safe
  end

end
