require 'pry'
class CashRegister

    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    attr_accessor :history 


    def initialize(employee_discount= 0)

        @total = 0
        @discount = employee_discount
        @items = []
        @history = []

    end

    def add_item(title, price, quant = 1)

        @history << [price, quant]
        quant.times do
            
            @items << title
        end
        self.total += price * quant
        

    end

    def apply_discount

        if @discount == 0
            success_message = "There is no discount to apply."
            return success_message
        else                        #100           #20
            @total = @total - (@total.to_f * (@discount.to_f/100.00))
            success_message = "After the discount, the total comes to $#{@total.to_i}."
            return success_message
            
        end

    end

    def void_last_transaction 
                                                                #remove
        last_trans_array = @history.pop #[[2.99, 3], [],[], '[20, 2]']
        last_trans_array[1].times do
            @items.pop                  #[[2.99, 3], [],[]]
            @total -= last_trans_array[0]
        end

    end

end



