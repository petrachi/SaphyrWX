class SessionsController < ApplicationController
  def init
    session[:auth_redirection] = {
      "data-active-path" => params[:active_path],
      "data-active-player" => params[:active_player],
      "data-active-user" => params[:active_user],
      "data-document" => 'auth-redirection',
      "data-select-path" => params[:select_path],
      "data-select-player" => params[:select_player]
    }

    head 200
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to paths_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to user_url, :notice => "Signed out!"
  end
end
