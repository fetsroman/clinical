require 'jwt'

class JsonWebToken
  SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(payload)
    payload[:exp] = 1.month.from_now.to_i
    JWT.encode(payload, SECRET_KEY, 'none')
  end

  def self.decode(token)
    decoded = JWT.decode(token, nil, false)[0]
    HashWithIndifferentAccess.new decoded
  end
end