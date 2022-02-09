module ControllerSpecHelper
  require 'json_web_token'

  # generate tokens from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired tokens from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id}, exp: (Time.now.to_i - 10))
  end

  # return valid headers
  def valid_headers
    {
      "Authorization" => "Bearer #{ token_generator(user.id) }",
      "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end