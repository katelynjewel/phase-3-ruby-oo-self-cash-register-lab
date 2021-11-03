require "pry"

class CashRegister
    
    attr_accessor :total, :discount, :items, :last_item

    def initialize discount = 0
        @total = 0
        @discount = discount
        @items = []
        @last_item = last_item
    end

    def add_item title, price, quantity = 1
        self.total += price * quantity
        quantity.times do
            items << title
        end
        self.last_item = price * quantity
    end

    def apply_discount 
        if @discount == 0
            "There is no discount to apply."
        elsif self.total -= @total * @discount / 100.0
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def void_last_transaction
        self.total = @total - @last_item
    end

end