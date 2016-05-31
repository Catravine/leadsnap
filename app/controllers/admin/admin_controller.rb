class Admin::AdminController < ApplicationController

  before_action :authenticate_admin

  def index
    @campaigns = Campaign.all
    @users = User.all
    @room_week_total = Sale.room_week_total
    @room_day_total = Sale.room_day_total
  end

  private

  def authenticate_admin
    redirect_to root_path if current_user.standard?
  end

end
