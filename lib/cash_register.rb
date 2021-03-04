class CashRegister

attr_accessor :total, :discount, :items, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity = 1)
    # total += ((title * price) * quantity)
    transaction = price * quantity
    self.total += transaction
    quantity.times do 
      self.items.push title
    end
    self.transactions.push transaction
  end

  def apply_discount
    if @discount.positive?
      self.total -= self.total * (self.discount / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @transactions.pop
  end
end

