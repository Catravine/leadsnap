class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      flash[:notice] = "Campaign saved."
      redirect_to @campaign
    else
      flash[:alert] = "There was an error saving Campaign.  Please try again."
      render :new
    end
  end

  def edit
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :year, :code, :callback_phone, :notes, :available)
  end

end
