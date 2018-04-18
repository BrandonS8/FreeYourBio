class SettingsController < ApplicationController
  def edit
    @user = User.find_by_username(params[:id])
    if (@user == current_user)
      @setting = @user.settings[0]
    else
      flash.now[:alert] = "Not yours"
      redirect_to user_profile_path(@user)
    end
  end

  def update
    @user = User.find_by_username(params[:id])
    if (@user == current_user)
      @setting = Setting.where(user: @user)
      @setting.update(setting_params)
      redirect_to user_profile_path(@user)
    else
      flash[:alert] = "Not yours"
      redirect_to user_profile_path(@user)
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:title, :about, :embedded)
  end
end
