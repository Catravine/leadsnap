class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.assign_attributes(user_params)
    @user.save
    redirect_to :back
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to :back
  end

  def current_user_home
    redirect_to profile_path(current_user)
  end

  private

  def record_not_found
    flash[:alert] = "No such User ID. Dave's not here, man."
    redirect_to(request.referrer || root_path)
  end

  def user_params
    params.require(:user).permit(:email, :fullname, :phone, :nickname, :password, :password_confirmation, :current_password, :role, :approved)
  end

end
