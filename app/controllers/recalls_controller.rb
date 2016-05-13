class RecallsController < ApplicationController
  # Which is not ideal, but 'Callback' is already taken.

 def new
   @recall = Recall.new
 end

 def create
   @recall = Recall.new(recall_params)
   current_lead_id = params[:recall][:current_lead_id]
   @recall.user = current_user
   @recall.lead = Lead.find(current_lead_id)
   @recall.time = Date.strptime(params[:recall][:time], "%m/%d/%Y")
   if @recall.save
     flash[:notice] = "Callback created for user: #{current_user.nickname}."
   else
     flash[:alert] = "There was an error saving this Callback.  Please try again."
   end
   redirect_to request.referrer
 end

 def edit
   @recall = Recall.find(params[:id])
 end

 def update
   @recall = Recall.find(params[:id])
   @recall.assign_attributes(recall_params)
   @recall.time = Date.strptime(params[:recall][:time], "%m/%d/%Y") if recall_params.include?(:time)
   if @recall.save
     flash[:notice] = "Callback updated."
   else
     flash[:alert] = "There was an error updated Campaign.  Please try again."
   end
   redirect_to request.referrer
 end

 private

 def recall_params
   params.require(:recall).permit(:user, :lead, :time, :notes, :new_time)
 end

end
