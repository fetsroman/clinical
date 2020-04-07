class Message
  # attr_accessor :name, :phone_number, :address

  def initialize(params, current_user, currency)
    @params = params
    @current_user = current_user
    @currency = currency
  end

  def items
    some = ""
    @current_user.cart.line_items.each do |line_item|
      some << "
Назва: #{line_item.item.title.to_s} \n
Артикул: #{line_item.article.to_s} \n
Кількість: #{line_item.quantity.to_s} \n
Ціна(1шт): #{line_item.price(@current_user)} \n\n

"
    end
    return some
  end

  def msg
    "Корисувач: #{@params[:order][:name]} \n
Знижка: #{@current_user.discount} \n
По адресі: #{@params[:order][:address]} \n
Номер телефону: #{@params[:order][:phone_number]} \n\n

В вас купили такі товари: \n
#{items}
\n\n
На суму: #{@current_user.cart.total_price(@current_user).round(2)} #{@currency}"
  end
end