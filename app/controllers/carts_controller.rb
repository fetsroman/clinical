class CartsController < ApplicationController
  before_action :authorize_request

  # GET /carts
  def index
    render json: @current_user.cart
  end
end
