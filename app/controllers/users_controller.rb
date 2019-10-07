class UsersController < ApplicationController
  before_action :authorize_request
  before_action :set_user, only: [:show]

  # GET /users/1
  def show
    render json: @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
