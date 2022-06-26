require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction_price

  def initialize(discount=0, total=0)
    @total = total
    @discount = discount
    @items = []
    @last_transaction_price = nil
  end

  def add_item(item, price, quantity=0)
    if quantity == 0
      self.items << item
      self.last_transaction_price = price
      self.total += price
    else
      x = quantity
      while x > 0
        items << item
        x -= 1
      end
      self.last_transaction_price = price * quantity
      self.total += price * quantity
    end
  end

  def apply_discount
    if self.discount > 0
      self.total = (self.total - ((self.total * self.discount) / 100))
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction_price
  end

end