require 'json'
require './lib/order.rb'
require './lib/shop.rb'

class Till

  include Discount

  attr_accessor :orders, :muffin_discount

  def initialize(shop)
    @orders = []
    @tax = 0.0864
    @shop = shop
    @muffin_discount = true
  end

  def register_order(order)
    @orders << order
  end

  def table_order(table_number)
    table = @orders.select { |table| table.table_number == table_number}
    @table_order = table[0].table_order
  end

# check if one array contains an element of another array?

  def add_prices(table_number)
    table_order(table_number)
    @shop.menu_prices.each do |k,v|    # {"Cafe Latte"=>4.75, "Flat White"=>4.75, "Cappucino"=>3.85, "Single Espresso"=>2.05, "Double Espresso"=>3.75, "Americano"=>3.75, "Cortado"=>4.55, "Tea"=>3.65, "Choc Mudcake"=>6.4, "Choc Mousse"=>8.2, "Affogato"=>14.8, "Tiramisu"=>11.4, "Blueberry Muffin"=>4.05, "Chocolate Chip Muffin"=>4.05, "Muffin Of The Day"=>4.55}                  # "Cafe Latte"=>4.75
      @table_order.each do |order|
        order[:price] = v * order[:quantity] if order[:item] == k
      end
    end
  end

  def calc_subtotal(table_number)
    add_prices(table_number)
    table_order(table_number)
    @table_order.inject(0) { |memo, value|  memo + value[:price] }.round(2)
  end

  def calc_tax(table_number)
    (calc_subtotal(table_number) * @tax ).round(2)
  end

  def calc_total(table_number)
    total = calc_tax(table_number) + calc_subtotal(table_number)
  end

  def order_information(table_number)
    { subtotal: calc_subtotal(table_number),
      tax: calc_tax(table_number),
      total: calc_total(table_number) }
  end

end
