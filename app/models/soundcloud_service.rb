class SoundcloudService

  def self.login(params)
    client = Soundcloud.new(:client_id => 'e6cec03e9db1f86a994857320fa6b7e3',
                        :client_secret => '82d05d53abcd4e4b44a4e1ddf5baed29',
                        :redirect_uri => 'http://localhost:3000/callback')
    code = params[:code]
    session[:access_token] = client.exchange_token(:code => code)
  end

end
