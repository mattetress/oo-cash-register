class CashRegister
  attr_accessor :total
  attr_reader :discount
  attr_accessor :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    @last_transaction = price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount > 0
      @total -= @total * @discount/100
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
