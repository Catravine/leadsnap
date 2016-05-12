class RecallsController < ApplicationController

 def new
   @recall = Recall.new
 end

 def create
   @recall = Recall.new
   @lead = Lead.find(444)
   @recall.user = current_user
   @recall.lead = @lead
   @recall.time = Time.now
   @recall.notes = params[:recall][:notes]
   if @recall.save
     flash[:notice] = "CBCC hee hee. #{current_user.nickname}.  *#{params[:lead]}* is the lead."
   else
     flash[:alert] = "There was an error saving CB.  Please try again."
   end
   redirect_to campaign_lead_path(@lead.campaign, @lead)
 end

 private

 # def recall_params
 #   params.require(:recall).permit(:user, :lead, :time, :notes)
 # end

end
