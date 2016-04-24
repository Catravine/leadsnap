class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    authorize @campaign
    if @campaign.save
      flash[:notice] = "Campaign saved."
      redirect_to @campaign
    else
      flash[:alert] = "There was an error saving Campaign.  Please try again."
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def update
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    @campaign.assign_attributes(campaign_params)
    if @campaign.save
      flash[:notice] = "Campaign updated."
      redirect_to @campaign
    else
      flash[:alert] = "There was an error updated Campaign.  Please try again."
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    authorize @campaign
    if @campaign.destroy
      flash[:notice] = "#{@campaign.name} was deleted."
      redirect_to campaigns_path
    else
      flash[:alert] = "There was an error deleting Campaign.  Please try again."
      render :show
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :year, :code, :callback_phone, :notes, :available)
  end

end
