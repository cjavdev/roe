class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(oauth_params)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def oauth_params
    auth = env['omniauth.auth']
    {
      email: auth.fetch(:info, {}).fetch(:email, nil),
      provider: auth.fetch(:provider, ''),
      uid: auth.fetch(:uid, nil),
      oauth_token: auth.fetch(:credentials, {}).fetch(:token, nil),
      oauth_expires_at: Time.at(
        auth.fetch(:credentials, {}).fetch(:expires_at, nil)
      ),
      first_name: auth.fetch(:info, '').fetch(:name, '').split(' ').first,
      last_name: auth.fetch(:info, '').fetch(:name, '').split(' ').last
    }
  end
end
