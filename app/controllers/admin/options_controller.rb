class Admin::OptionsController < AdminsController
  before_action :authorize_request_admin
  before_action :set_option, only: [:destroy]

  # DELETE /options/1
  def destroy
    @option.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_option
    @option = Option.find(params[:id])
  end
end
