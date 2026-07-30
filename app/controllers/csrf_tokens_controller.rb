class CsrfTokensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    render json: { csrf_token: form_authenticity_token }
  end
end
