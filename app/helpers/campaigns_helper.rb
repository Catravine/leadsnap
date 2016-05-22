module CampaignsHelper

  def csv_download_path(campaign)
    "#{campaign.id}/leads.csv"
  end

end
