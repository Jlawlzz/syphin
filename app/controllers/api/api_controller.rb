class Api::ApiController < ApplicationController

  protect_from_forgery with: :null_session

  helper_method :google_auth, :soundcloud_auth

  def google_auth
    @google_auth ||= session[:google_auth] if session[:google_auth]
  end

  def soundcloud_auth
    @soundcloud_auth ||= session[:soundcloud_auth] if session[:soundcloud_auth]
  end

end
