class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def current_user_home
    redirect_to profile_path(current_user)
  end

end
