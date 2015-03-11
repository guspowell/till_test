require 'json'
require './lib/order.rb'

class Till

  attr_accessor :menu, :orders

  def initialize
    @orders = []
  end

  def load_information(json)
    file = File.read(json)
    @menu = JSON.parse(file)[0]
  end

  def register_order(order)
    @orders << order
  end

  def add_prices(table_number)
    table = @orders.select { |table| table.table_number == table_number}  # [{:item=>"Cafe Latte", :quantity=>2}, {:item=>"Flat White", :quantity=>1}]
    table_order = table[0].all_items
    price_list = self.menu['prices'][0]     # {"Cafe Latte"=>4.75, "Flat White"=>4.75, "Cappucino"=>3.85, "Single Espresso"=>2.05, "Double Espresso"=>3.75, "Americano"=>3.75, "Cortado"=>4.55, "Tea"=>3.65, "Choc Mudcake"=>6.4, "Choc Mousse"=>8.2, "Affogato"=>14.8, "Tiramisu"=>11.4, "Blueberry Muffin"=>4.05, "Chocolate Chip Muffin"=>4.05, "Muffin Of The Day"=>4.55}
    price_list.each do |k,v|                   # "Cafe Latte"=>4.75
      table_order.each do |order|       # {:item=>"Cafe Latte", :quantity=>2}
        if order[:item] == k
          order[:price] = v * order[:quantity]
        end
      end
    end
  end

  def calc_subtotal(table_number)
    table = @orders.select { |table| table.table_number == table_number}  # [{:item=>"Cafe Latte", :quantity=>2, :price: 9.5}, {:item=>"Flat White", :quantity=>1, :price => 4.75}]
    table_order = table[0]
    p table_order.inject { |memo, value|  memo + value[:price]}
  end

  def order_information(order)
    { subtotal: calc_subtotal,
      tax: calc_tax,
      total: calc_total }
  end






end
