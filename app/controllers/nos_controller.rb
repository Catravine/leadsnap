class NosController < ApplicationController

 def new
   @no = No.new
 end

 def create
   @no = No.new(no_params)
   @current_lead = Lead.find(params[:no][:current_lead_id])
   @next_lead = @current_lead.campaign.next_lead(@current_lead)
   @current_lead.update(round: round =+ 1)
   @no.user = current_user
   @no.lead = @current_lead
   @no.date = Time.now
   if @no.save
     Recall.where(lead: @current_lead).first.destroy if Recall.where(lead: @current_lead).count > 0
     flash[:notice] = "#{@current_lead.name1} marked 'no'."
     redirect_to campaign_lead_path(@current_lead.campaign, @next_lead)
   else
     flash[:alert] = "There was an error marking this no.  Please try again."
     redirect_to request.referrer
   end
 end

 private

 def no_params
   params.require(:no).permit(:user, :lead, :date)
 end

end
