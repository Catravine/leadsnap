module CampaignsHelper

  def sources(campaign)
    Lead.where(campaign_id: campaign.id).pluck(:source_code).uniq
  end

  def csv_download_path(campaign)
    "#{campaign.id}/leads.csv"
  end

end
