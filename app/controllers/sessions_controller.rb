class  SessionsController < Devise::SessionsController
  # before_filter :check_approved, :only => [:create]
  #
  # def check_approved
  #   if current_user.approved?
  #   else
  #     flash[:alert] = "You're not approved yet... be patient!"
  #     redirect_to about_path
  #   end
  # end

  def create
    self.resource = warden.authenticate!(auth_options)
    if self.resource.approved?
      #set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash[:alert] = "You're not approved yet... be patient!"
      redirect_to about_path
    end
  end

end
