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
    if @lead.day_lead?
      redirect_to campaign_lead_path(@campaign, @campaign.next_lead('day'))
    else
      redirect_to campaign_lead_path(@campaign, @campaign.next_lead(@lead.source_code))
    end
    @lead.assign_attributes(lead_params)

    if @lead.save
      flash[:notice] = "Lead for '#{@lead.name1}' marked."
    else
      flash.now[:alert] = "There was an error marking the lead. Please try again."
    end
    @lead.disconnect_check
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
