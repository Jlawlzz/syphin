class Api::V1::SessionsController < Api::ApiController

  respond_to :json

  def create
    if params[:provider] == 'google'
      session[:google_auth] = GoogleService.user_login(request.env['omniauth.auth'],
                                                       current_user)
      respond_with google_auth.username
    end
  end
end
