class GoogleService

  def self.login(auth, user)
    token = find_or_create_by(uid: auth[:uid],
                              provider_id: Provider.find_by(name: 'google'),
                              user_id: user.id)
    update_token(auth)
    token
  end

  def self.update_token(auth)
    token.update_attributes(
      uid: auth.uid,
      username: auth.info.name,
      token: auth.credentials.token)
    token.save
  end
end
