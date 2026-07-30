class DevSessionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    raise "only in development" unless Rails.env.development?

    user = User.first_or_create!(
      email: "dev@example.com",
      provider: "dev",
      uid: "dev-user",
      name: "Dev User"
    )

    sign_in(user)
    render json: user, status: :ok
  end
end
