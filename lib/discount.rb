module Discount

  def toggle_muffin_discount
    @muffin_discount = !@muffin_discount
  end

  def fifty_pound_discount(table_number, discount)
    calc_subtotal(table_number) * discount if calc_subtotal(table_number) > 50
  end

end
