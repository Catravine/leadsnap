class ApplicationController < ActionController::Base

  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def record_not_found
    flash[:alert] = "Hey... that's an invalid 'thingie' you tried to do!!"
    redirect_to(request.referrer || root_path)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
