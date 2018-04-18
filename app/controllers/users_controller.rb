class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:id])
    if Setting.where(user: @user).blank?
      @user.settings.create(title: "#{@user.username}'s Page", about: "Just joined #FreeYourBio", embedded: "")
      flash.now[:notify] = "Don't forget to update your profile!"
    end
  end
end
