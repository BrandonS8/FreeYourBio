class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    puts link_params
    if @link.site == "Snapchat"
      @link.update(url: "https://www.snapchat.com/add/#{link_params[:url]}", img: "https://app.snapchat.com/web/deeplink/snapcode?username=#{link_params[:url]}&type=SVG")
    elsif @link.site == "Facebook"
      metaUrl = MetaInspector.new(@link.url)
      @link.update(img: metaUrl.images.best)
    end
    redirect_to link_path(@link)
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    redirect_to link_path(@link)
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
  end

  private

  def link_params
    params.require(:link).permit(:site, :title, :url, :img)
  end
end
