class SyncController < ApplicationController
  before_filter :authenticate_admin_user!, :set_account, :check_account

  def index
  end

  def sync_playlist
    playlist = Yt::Playlist.new id: params[:id], auth: @account
    Path.create_with_yt playlist

    head :ok
  end

  def sync_video
    video = Yt::Video.new id: params[:id], auth: @account
    Video.create_with_yt video, path: Path.find_by(yt_id: params[:playlist_id])

    head :ok
  end


  protected def set_account
    if params[:code]
      @account = Yt::Account.new authorization_code: params[:code], redirect_uri: "http://#{request.host_with_port}/wxa/sync"
      session[:yt_access_token] = @account.access_token
      redirect_to action: 'index' and return
    elsif session[:yt_access_token]
      @account = Yt::Account.new access_token: session[:yt_access_token], redirect_uri: "http://#{request.host_with_port}/wxa/sync"
    end
  end

  protected def check_account
    @account.playlists
  rescue
    @account = nil
    session[:yt_access_token] = nil
  end
end
