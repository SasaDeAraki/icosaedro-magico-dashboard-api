module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      auth = request.env["omniauth.auth"]
      user = User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |u|
        u.email = auth.info.email
        u.name = auth.info.name
      end

      sign_in(user)
      redirect_to "#{ENV['FRONTEND_URL']}/auth/callback", allow_other_host: true
    end

    def failure
      render json: { error: "OAuth authentication failed" }, status: :unauthorized
    end
  end
end
