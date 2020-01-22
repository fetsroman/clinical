class PaymentController < ApplicationController
  before_action :authorize_request

  def card_payment
    if @current_user.country == "Україна"
      currency = "USD"
    elsif @current_user.country == "Россия"
      currency = "RUB"
    end
    #2jVyps-fhtsvIw2jVyps-fhtsvIw
    @liqpay = ::Liqpay::Liqpay.new
    token = SecureRandom.urlsafe_base64.to_s
    @liqpay_request = @liqpay.api("request", {
        action: "p2p",
        version: "3",
        amount: @current_user.cart.total_price(@current_user),
        currency: currency,
        description: "Дякуємо за покупку, за допомогою нашого сервісу!",
        order_id: token,
        receiver_card: ENV['CARD'],
        card: params[:card],
        card_exp_month: params[:card_month],
        card_exp_year: params[:card_year],
        card_cvv: params[:card_cvv]
    })

    if @liqpay_request['result'] == 'ok'  && @liqpay_request['currency'] == currency && @liqpay_request['order_id'] == token
      total_price = @liqpay_request['amount']

      message = Message.new(message_params, @current_user, @liqpay_request['currency'])
      NotificationMailer.purchase_notification(message.msg).deliver_later
      TelegramBotWorker.perform_async(message.msg)

      @current_user.cart.delete_item

      render json: {total_price: total_price}, status: :ok
    else
      render json: { error: @liqpay_request['err_description'] }, status: 403
    end
  end

  def non_cash_payment
    if @current_user.country == "Україна"
      currency = "USD"
    elsif @current_user.country == "Россия"
      currency = "RUB"
    end

    total_price = @current_user.cart.total_price(@current_user)

    message = Message.new(message_params, @current_user, currency)
    NotificationMailer.purchase_notification(message.msg).deliver_later
    TelegramBotWorker.perform_async(message.msg)
    @current_user.cart.delete_item

    render json: {total_price: total_price}, status: :ok
  end

  private

  def message_params
    # if params[:order].is_a? String
    #   params[:order] = JSON.parse params[:order]
    # end
    params.permit(:card, :card_month, :card_year, :card_cvv, order:[:name, :address, :phone_number])
  end
end
