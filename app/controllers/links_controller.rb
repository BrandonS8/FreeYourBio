class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.create(link_params)
    redirect_to link_path(@link)
  end

  def edit
    @link = Link.find(params[:id])
    redirect_to link_path(@link)
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
