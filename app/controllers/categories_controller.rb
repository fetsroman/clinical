class CategoriesController < ApplicationController
  before_action :authorize_request
  before_action :set_category, only: [:show]

  # GET /categories
  def index
    @categories = Category.all.order("number")

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category.items
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end
end
