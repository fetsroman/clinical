class Message
  # attr_accessor :name, :phone_number, :address

  def initialize(params, current_user, currency)
    @params = params
    @current_user = current_user
    @currency = currency
  end

  def msg
    "Корисувач: #{@params[:name]}
Знижка: #{@current_user.discount}
По адресі: #{@params[:address]}
Номер телефону: #{@params[:phone_number]}

В вас купили такі товари:
#{ @current_user.cart.line_items.each do |line_item|
    'Назва:' + line_item.item.title +
    'Артикул:' + line_item.article +
    'Ціна(1шт):' + line_item.quantity + '\n\n'
  end
}
На суму: #{@current_user.cart.total_price(@current_user)} #{@currency}"
  end
end