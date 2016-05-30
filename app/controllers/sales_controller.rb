class SalesController < ApplicationController

 def new
   @sale = Sale.new
 end

 def create
   @sale = Sale.new(sale_params)
   @current_lead = Lead.find(params[:sale][:current_lead_id])
   @next_lead = @current_lead.campaign.next_lead(@current_lead)
   @sale.user = current_user
   @sale.lead = @current_lead
   @sale.date = Time.now
   if @sale.save
     Recall.where(lead: @current_lead).first.destroy if Recall.where(lead: @current_lead).count > 0
     flash[:notice] = "#{current_user.nickname} sold #{@current_lead.name1} $#{@sale.amount}."
     redirect_to campaign_lead_path(@current_lead.campaign, @next_lead)
   else
     flash[:alert] = "There was an error saving this sale.  Please try again."
     redirect_to request.referrer
   end
 end

 private

 def sale_params
   params.require(:sale).permit(:user, :lead, :date, :amount)
 end

end
