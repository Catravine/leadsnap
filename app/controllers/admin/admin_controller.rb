class Admin::AdminController < ApplicationController

  before_action :authenticate_admin

  def index
    @campaigns = Campaign.all
  end

  private

  def authenticate_admin
    redirect_to root_path if current_user.standard?
  end

end
