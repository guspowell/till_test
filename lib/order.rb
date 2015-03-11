class Order

  attr_accessor :table_number, :all_items

  def initialize(table_number)
    @table_number = table_number
    @all_items = []
  end

  def add_item(item, quantity)
    @all_items << { item: item, quantity: quantity}
  end

end
