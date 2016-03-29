class Api::V1::SessionsController < Api::ApiController

  respond_to :json

  def create
    if params[:provider] == 'google'
      session[:google_auth] = GoogleService.user_login(request.env['omniauth.auth'],
                                                       current_user)
      respond_with google_auth.username
    elsif params[:provider] == 'soundcloud'
      session[:soundcloud_auth] = SoundcloudService.user_login(params)
      respond_with soundcloud_auth
    end
  end
end
