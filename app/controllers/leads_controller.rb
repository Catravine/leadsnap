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
    if lead_params.include?(:phone1) || lead_params.include?(:phone2) || lead_params.include?(:phone3)
      @lead.update(lead_params)
      @lead.disconnect_check
      redirect_to campaign_lead_path(@campaign, @lead) and return unless @lead.disconnected?
    end
    redirect_to campaign_lead_path(@campaign, @campaign.next_lead(@lead))
    @lead.update(lead_params)
  end

  def import
    count = Lead.import(params[:file], params[:campaign_id])
    redirect_to campaign_path(params[:campaign_id]), notice: "imported #{count} leads to (campaign)."
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
