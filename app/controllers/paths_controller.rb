class PathsController < ApplicationController

  def index
    @paths = Path.published
  end

  def show
    @videos = Path.published.find_by(tag: params[:id]).videos.published
    render layout: false
  end
end
