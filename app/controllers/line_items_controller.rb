class LineItemsController < ApplicationController
  before_action :authorize_request
  before_action :set_line_item, only: [:update, :destroy]

  # POST /line_items
  def create
    @line_item = @current_user.cart.line_items.find_by(item_id: line_item_params[:item_id], article: line_item_params[:article])

    if @line_item.present?
      if @line_item.update!(quantity: (@line_item.quantity + line_item_params[:quantity].to_i))
        render status: :ok
      else
        render json: @line_item.errors, status: :unprocessable_entity
      end
    else
      @line_item = @current_user.cart.line_items.build(line_item_params)
      if @line_item.save
        render status: :ok
      else
        render json: @line_item.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /line_items/1
  def update
    if @line_item.update(line_item_params)
      render json: @current_user.cart, status: :ok
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /line_items/1
  def destroy
    @line_item.destroy
    render json: @current_user.cart, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def line_item_params
      params.permit(:item_id, :quantity, :article)
    end
end
