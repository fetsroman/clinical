class BannersController < ApplicationController
  before_action :authorize_request

  # GET /banners
  def index
    @banners = Banner.all.first

    render json: @banners
  end
end
