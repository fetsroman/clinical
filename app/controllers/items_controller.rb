class ItemsController < ApplicationController
  before_action :authorize_request
  before_action :set_item, only: [:show]

  # GET /items
  def index
    if params[:query].present?
      @items = Item.search(params[:query])
    else
      @items = Item.all
    end

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end
end
