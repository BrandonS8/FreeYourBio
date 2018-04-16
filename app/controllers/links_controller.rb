class LinksController < ApplicationController
  # def index
  #   # if current_user.try(:admin?)
  #   @user = User.find_by_username(params[:id])
  #   @links = @user.links
  #   # else
  #   # redirect_to root_path
  #   # end
  # end

  def index
    @user = User.find_by_username(params[:user_id])
    redirect_to user_profile_path(@user)
  end

  def show
    @user = User.find_by_username(params[:user_id])
    @link = Link.find(params[:id])
  end

  def new
    @user = User.find_by_username(params[:user_id])
    @link = Link.new
  end

  def create
    @user = User.find_by_username(params[:user_id])
    @link = @user.links.create!(link_params)
    if @link.site == "Snapchat"
      @link.update(url: "https://www.snapchat.com/add/#{link_params[:url]}", img: "https://app.snapchat.com/web/deeplink/snapcode?username=#{link_params[:url]}&type=SVG")
    elsif @link.site == "Facebook"
      metaUrl = MetaInspector.new(@link.url)
      @link.update(img: metaUrl.images.best)
    elsif @link.site == "Twitter"
      metaUrl = MetaInspector.new("https://twitter.com/#{link_params[:url]}")
      @link.update(url: "https://twitter.com/#{link_params[:url]}", img: metaUrl.images[1])
    elsif @link.site == "YouTube"
      if /^https?:\/\/(.*)/.match(@link.url)
        @link.update(url: "https://#{@link.url}")
        # else
        #   flash.now[:alert] = "Please enter a full URL https://example.com"
        #   render action: "new"
      end
      metaUrl = MetaInspector.new(@link.url)
      @link.update(img: metaUrl.images.best)
    elsif @link.site == "Other"
      if /gif|jpg|jpeg|tiff|png|svg/i.match(@link.img)
      else
        flash.now[:alert] = "Please link to an image"
        render action: "new"
      end
    end
    redirect_to user_link_path(@user, @link)
  end

  def edit
    @user = User.find_by_username(params[:user_id])
    @link = Link.find(params[:id])
  end

  def update
    @user = User.find_by_username(params[:user_id])
    @link = Link.find(params[:id])
    if @link.user == current_user || current_user.try(:admin?)
      if /gif|jpg|jpeg|tiff|png|svg/i.match(link_params[:img])
        @link.update(link_params)
        redirect_to user_link_path(@user, @link)
      else
        flash.now[:alert] = "Please link to an image"
        render action: "edit"
      end
    else
      flash[:alert] = "This is not yours! NO TOUCHY."
      redirect_to user_profile_path(@user)
    end
  end

  def destroy
    @user = User.find_by_username(params[:user_id])
    @link = Link.find(params[:id])
    if @link.user == current_user || current_user.try(:admin?)
      @link.destroy
      redirect_to user_profile_path(@user)
    else
      flash[:alert] = "This is not yours! NO TOUCHY."
      redirect_to user_profile_path(@user)
    end
  end

  private

  def link_params
    params.require(:link).permit(:site, :title, :url, :img)
  end
end
