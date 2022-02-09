class PaymentController < ApplicationController
  before_action :authorize_request

  def card_payment
    if @current_user.country == "Україна"
      currency = "UAH"
    elsif @current_user.country == "Россия"
      currency = "RUB"
    end

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
      items = @current_user.cart.line_items
      total_price = @liqpay_request['amount']

      #NotificationMailer.purchase_notification(items: items, total_price: total_price, currency: @liqpay_request['currency'], order: params[:order]).deliver_later
      TelegramBotWorker.perform_async(items: items, total_price: total_price, currency: @liqpay_request['currency'], order: params[:order])

      @current_user.cart.delete_item

      render json: {total_price: total_price}, status: :ok
    else
      render json: { error: @liqpay_request['err_description'] }, status: 403
    end
  end

  def non_cash_payment
    if @current_user.country == "Україна"
      currency = "UAH"
    elsif @current_user.country == "Россия"
      currency = "RUB"
    end

    items = @current_user.cart.line_items
    total_price = @current_user.cart.total_price(@current_user)

    #NotificationMailer.purchase_notification(items: items, total_price: total_price, currency: currency, order: params[:order]).deliver_later
    TelegramBotWorker.perform_async(items, total_price, currency, params[:order])
    @current_user.cart.delete_item

    render json: {total_price: total_price}, status: :ok
  end
end
