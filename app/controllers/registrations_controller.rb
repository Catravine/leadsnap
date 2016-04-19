class RegistrationsController < Devise::RegistrationsController

  # needed to override the protected #sign_up
  def create
    super
    flash[:notice] = "Welcome #{resource.email}! Please wait to be confirmed by an Admin."
  end

  protected

  # keep from logging in user who's just signed up
  def sign_up(resource_name, resource)
    true
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :fullname, :phone, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :fullname, :phone, :password, :password_confirmation, :current_password)
  end
end
