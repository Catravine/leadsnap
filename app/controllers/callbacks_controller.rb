class CallbacksController < ApplicationController

 def new
   @callback = Callback.new
 end

 def create
  #  @callback = Callback.new
  #  @callback.user = current_user
  #  @callback.lead = @lead
  #  @callback.time = Time.now
  #  @callback.notes = params[:callback][:notes]
  #  if @callback.save
  #    flash[:notice] = "Callback saved for #{current_user.nickname}."
  #    redirect_to @lead
  #  else
  #    flash.now[:alert] = "There was an error making a callback."
  #    redirect_to @lead
  #  end
 end

end
