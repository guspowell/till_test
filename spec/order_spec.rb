require 'order.rb'

describe Order do

  it 'should initialize with a table number' do
    order = Order.new(2)
    expect( order.table_number ).to eq 2
  end

  it 'should be able to add an item and a quantity' do
    order = Order.new(2)
    order.add_item('Cafe Latte', 2)
    expect(order.table_order).to eq([{ item: 'Cafe Latte', quantity: 2 }])
  end

end
