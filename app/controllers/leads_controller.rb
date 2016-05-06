class LeadsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @leads = Lead.where(campaign_id: @campaign)
    authorize @leads
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @lead = Lead.find(params[:id])
    @lead.dial_lead
  end

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @lead = Lead.find(params[:id])

    @lead.update(lead_params)
    @lead.disconnect_check

    if @lead.disconnected?
      if @lead.day_lead?
        redirect_to campaign_lead_path(@campaign, @campaign.next_lead('day')) and return
      else
        redirect_to campaign_lead_path(@campaign, @campaign.next_lead(@lead.source_code)) and return
      end
    end
    redirect_to campaign_lead_path(@campaign, @lead) 
  end

  private

  def record_not_found
    flash[:alert] = "No such Lead ID. These are not the leads you're looking for."
    redirect_to(request.referrer || root_path)
  end

  def lead_params
    params.require(:lead).permit(:killed, :day_lead, :phone1, :phone2, :phone3)
  end

end
