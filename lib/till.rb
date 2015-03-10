require 'json'

class Till

  attr_accessor :order

  def initialize
    @order = []
  end

  def add_item(item, quantity)
    @order << {item: item, quantity: quantity}
  end

end
