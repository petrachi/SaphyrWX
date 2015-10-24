class VideosController < ApplicationController

  def show
    @video = Video.published.find_by(id: params[:id])
    render layout: false
  end

end
