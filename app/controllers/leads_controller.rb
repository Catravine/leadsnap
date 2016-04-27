class LeadsController < ApplicationController

  def show
    @lead = Lead.find(params[:id])
  end

end
