class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end

  def show
    @lead = Lead.find(params[:id])
    @lead.dial_lead
  end

end
