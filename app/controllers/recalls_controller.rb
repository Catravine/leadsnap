class RecallsController < ApplicationController

 def new
   @recall = Recall.new
 end

 def create
   @recall = Recall.new
   @current_lead_id = params[:recall][:current_lead_id]
   @recall.user = current_user
   @recall.lead = Lead.find_by(id: @current_lead_id)
   @recall.time = Time.now
   @recall.notes = params[:recall][:notes]
   if @recall.save
     flash[:notice] = "Callback created for user: #{current_user.nickname}."
   else
     flash[:alert] = "There was an error saving this Callback.  Please try again."
   end
   redirect_to request.referrer
 end

 private

 # def recall_params
 #   params.require(:recall).permit(:user, :lead, :time, :notes)
 # end

end
