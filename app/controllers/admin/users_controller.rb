class Admin::UsersController < AdminsController
  before_action :authorize_request_admin
  before_action :set_user, only: [:show, :update, :destroy, :generate_password]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: {user: @user, addresses: @user.addresses}
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle.first(8).join

    if @user.save
      Cart.create(user_id: @user.id)

      render json: {user: @user, addresses: @user.addresses, password: @user.password}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {user: @user, addresses: @user.addresses}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def generate_password
    password = (('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle.first(8).join
    if @user.update(password: password)
      render json: {password: @user.password}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:username, :name, :discount, :country, addresses_attributes: [:id, :title])
    end
end
