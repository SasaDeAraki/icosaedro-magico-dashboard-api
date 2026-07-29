class UsersController < ApplicationController
  def index
    users = User.active
    render json: users
  end
end
