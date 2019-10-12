class BannersController < ApplicationController

  # GET /banners
  def index
    @banners = Banner.all.first

    render json: @banners
  end

  # GET /banners/1
  def show
    render json: @banner
  end
end
