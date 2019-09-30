class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      jwt_validate(header)
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])

    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message, status: 401 }
    rescue SessionExpiredError => e
      render json: { errors: e.message, status: 401 }
    end
  end

  def jwt_validate(header)
    raise SessionExpiredError if JwtBlacklist.where(jti: header).present?
  end

  def user_validate(object)
    unless @current_user.id == object.user_id
      render json: "Not success user"
    end
  end

  class SessionExpiredError < Exception
    def message
      "Sessions expired"
    end
  end
end
