class PathsController < ApplicationController
  before_filter :check_auth_redirect, only: :index

  def index
    @paths = Path.published
  end

  def show
    @videos = Path.published.find_by(tag: params[:id]).videos.published.order(:id)
    render layout: false
  end


  private def check_auth_redirect
    @redirect = session.delete(:auth_redirection) || {}
    @redirect = @redirect.delete_if{ |_, v| v.blank? }
  end
end
