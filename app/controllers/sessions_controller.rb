class  SessionsController < Devise::SessionsController

  def create
    self.resource = warden.authenticate!(auth_options)
    if self.resource.approved?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash[:alert] = "You're not approved yet... be patient!"
      #sign_out(resource)
      redirect_to root_path
    end
  end

end
