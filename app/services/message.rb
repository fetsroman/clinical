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
Назва: #{line_item.item.title.to_s}
Артикул: #{line_item.article.to_s}
Кількість: #{line_item.quantity.to_s}
Ціна(1шт): #{line_item.price(@current_user)}

"
    end
    return some
  end

  def msg
    "Корисувач: #{@params[:order][:name]}
Знижка: #{@current_user.discount}
По адресі: #{@params[:order][:address]}
Номер телефону: #{@params[:order][:phone_number]}

В вас купили такі товари:
#{items}

На суму: #{@current_user.cart.total_price(@current_user).round(2)} #{@currency}"
  end
end