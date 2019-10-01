class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /login
  def login
    @user = User.find_by_username(params[:username])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode({ user_id: @user.id }, 1.month.from_now)

      render json: { token: token, user: @user }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  # POST /logout
  def logout
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    JwtBlacklist.create(jti: header, exp: @decoded[:exp]) # exp - time in seconds format

    JwtTokenWorker.perform_at((@decoded[:exp] - Time.now.to_i).seconds.from_now, JwtBlacklist.where(jti: header).ids)
    render json: { message: 'User was logout' }, status: :ok
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
