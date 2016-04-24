class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
