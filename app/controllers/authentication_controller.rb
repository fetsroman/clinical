class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :sign_in

  # POST /sign_in
  def sign_in
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      token = JsonWebToken.encode({user_id: user.id })

      render json: { token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  # POST /sign_out
  def sign_out
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    JwtBlacklist.create(jti: header, exp: @decoded[:exp]) # exp - time in seconds format

    JwtDestroyWorker.perform_at((@decoded[:exp] - Time.now.to_i).seconds.from_now, JwtBlacklist.where(jti: header).ids)
    render json: { message: 'User was logout' }, status: :ok
  end

  private

  def login_params
    params.permit(:username, :password)
  end
end
