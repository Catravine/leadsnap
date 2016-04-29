class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @lead = @campaign.next_lead(params[:source_code])
    @lead.dial_lead
  end

end
