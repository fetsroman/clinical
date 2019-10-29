class Admin::BannerParametersController < AdminsController
  before_action :authorize_request_admin
  before_action :set_banner_parameter, only: [:destroy]

  # DELETE /banner_parameters/1
  def destroy
    @banner_parameter.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_banner_parameter
    @banner_parameter = BannerParameter.find(params[:id])
  end
end
