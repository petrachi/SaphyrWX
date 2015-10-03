class PathsController < ApplicationController

  def index
    @paths = Path.all
  end

  def show
    @videos = Path[params[:id]].videos
    render layout: false
  end
end
