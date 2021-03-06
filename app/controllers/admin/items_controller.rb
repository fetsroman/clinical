class Admin::ItemsController < AdminsController
  before_action :authorize_request_admin
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = Item.by_category(params[:category])

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      if params[:options_attributes].is_a? String
        params[:options_attributes] = JSON.parse params[:options_attributes]
      end
      params.permit(:category_id, :title, :description_uk, :description_ru, :image, options_attributes: [:id, :article, :price_uah, :price_rub, :volume])
    end
end
