module Discount

  def toggle_muffin_discount
    @muffin_discount == true if @muffin_discount = false
    @muffin_discount == false if @muffin_discount = true
  end

  def reduce_muffin_prices(discount)
    if @muffin_discount == true
      @orders.each do |order|
        order.table_order.each do |k,v|
          order[:price] = order[:price]*discount if v.include? "muffin"
        end
      end
    end
  end

  def calc_discount(table_number, discount)
    calc_subtotal(table_number) * discount if calc_subtotal(table_number) > 50
  end

end
