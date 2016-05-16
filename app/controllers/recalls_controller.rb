class RecallsController < ApplicationController
  # Which is not ideal, but 'Callback' is already taken.

 def new
   @recall = Recall.new
 end

 def create
   @recall = Recall.new(recall_params)
   @current_lead = Lead.find(params[:recall][:current_lead_id])
   @next_lead = @current_lead.campaign.next_lead(@current_lead)
   @recall.user = current_user
   @recall.lead = @current_lead
   if @recall.save
     flash[:notice] = "#{current_user.nickname} saved #{@current_lead.name1} as their Callback."
     redirect_to campaign_lead_path(@current_lead.campaign, @next_lead)
   else
     flash[:alert] = "There was an error saving this Callback.  Please try again."
     redirect_to request.referrer
   end
 end

 def edit
   @recall = Recall.find(params[:id])
 end

 def update
   @recall = Recall.find(params[:id])
   @recall.assign_attributes(recall_params)
   if params[:recall][:current_user_id]
     @recall.user = User.find(params[:recall][:current_user_id])
   end
   if @recall.save
     flash[:notice] = "Callback updated."
   else
     flash[:alert] = "There was an error updated Campaign.  Please try again."
   end
   redirect_to request.referrer
 end

 def destroy
   @recall = Recall.find(params[:id])
   if @recall.destroy
     flash[:notice] = "Callback for #{@recall.lead.name1} given up."
   else
     flash.now[:alert] = "There was an error removing this callback."
   end
   redirect_to request.referrer
 end

 private

 def recall_params
   params.require(:recall).permit(:user, :lead, :time, :notes, :new_time)
 end

end
