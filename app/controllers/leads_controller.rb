class LeadsController < ApplicationController

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @leads = Lead.where(campaign_id: @campaign)
    authorize @leads

    respond_to do |format|
      format.html
      format.csv { send_data @leads.to_csv, filename: "leads-#{@campaign.name}-#{Date.today}.csv"}
    end
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @lead = Lead.find(params[:id])
    @last_dial = @lead.last_dialed
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
    if @campaign.next_lead(@lead)
      redirect_to campaign_lead_path(@campaign, @campaign.next_lead(@lead))
    else # back to campaign if no more leads w/ that source after disc
      redirect_to campaign_path(@campaign)
    end
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
