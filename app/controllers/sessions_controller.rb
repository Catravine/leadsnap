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
    if (true) #user attempting sign in is approved
      super
    else
      flash[:alert] = "You're not approved yet... be patient!"
      redirect_to root_path
    end
  end

end
