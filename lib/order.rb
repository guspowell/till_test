class Order

  attr_accessor :table_number, :table_order

  def initialize(table_number)
    @table_number = table_number
    @table_order = []
  end

  def add_item(item, quantity)
    @table_order << { item: item, quantity: quantity}
  end

end
