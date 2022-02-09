class UsersController < ApplicationController
  before_action :authorize_request

  # GET /user
  def user
    render json: @current_user, serilizer: UserSerializer
  end
end
