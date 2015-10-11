class SyncController < ApplicationController
  before_filter :set_account, :check_account

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


  private def set_account
    if params[:code]
      @account = Yt::Account.new authorization_code: params[:code], redirect_uri: 'http://localhost:3000/wxa/sync'
      session[:yt_access_token] = @account.access_token
    elsif session[:yt_access_token]
      @account = Yt::Account.new access_token: session[:yt_access_token], redirect_uri: 'http://localhost:3000/wxa/sync'
    end
  end

  private def check_account
    @account.playlists
  rescue
    @account = nil
    session[:yt_access_token] = nil
  end
end
