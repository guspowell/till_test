module Discount

  def toggle_muffin_discount
    @muffin_discount = !@muffin_discount
  end

  def reduce_muffin_prices(discount)
    if @muffin_discount == true
      @orders.each do |table|
        table.table_order.each do |order|
          order[:price] = order[:price]*(1 - discount) if order[:item].include?("Muffin")
        end
      end
    end
  end

  def calc_discount(table_number, discount)
    calc_subtotal(table_number) * discount if calc_subtotal(table_number) > 50
  end

end
