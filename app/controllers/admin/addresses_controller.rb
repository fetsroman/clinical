class Admin::AddressesController < AdminsController
  before_action :authorize_request_admin
  before_action :set_address, only: [:destroy]

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end
end
