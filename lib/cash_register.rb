require 'pry'
class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times { self.items << title }
        self.last_transaction = [title, price, quantity]
    end

    def apply_discount
        return_message = ""
        self.total -= self.total * self.discount / 100
        if discount > 0
            return_message = "After the discount, the total comes to $#{self.total}."
        else
            return_message = "There is no discount to apply."
        end
        return_message
    end

    def void_last_transaction
        self.total -= self.last_transaction[1] * self.last_transaction[2]
    end

end