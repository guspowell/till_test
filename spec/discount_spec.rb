require 'discount.rb'

# class Till; include Discount; end

describe Discount do

  let(:shop) {Shop.new}
  let(:till) {Till.new(shop)}
  let(:order1) {Order.new(1)}

  it 'should be able to toggle the muffin discount' do
    expect(till.muffin_discount).to be false
    till.toggle_muffin_discount
    expect(till.muffin_discount).to be true
    till.toggle_muffin_discount
    expect(till.muffin_discount).to be false
  end

  it 'should have a 10% discount for overs over $50' do
    order1.add_item('Cafe Latte',20)
    shop.load_information('./hipstercoffee.json')
    till.register_order(order1)
    expect(till.calc_discount(1, 0.1)).to eq 9.5
  end

  it 'should reduce the muffin price by 10% if muffin discount is on' do
    shop.load_information('./hipstercoffee.json')
    order1.add_item('Muffin Of The Day', 1)
    till.register_order(order1)
    till.toggle_muffin_discount
    till.add_prices(1)
    expect(till.orders[0].table_order).to eq [{:item=>"Muffin Of The Day", :quantity=>1, :price=>4.55}]
    till.reduce_muffin_prices(0.1)
    expect(till.orders[0].table_order).to eq [{:item=>"Muffin Of The Day", :quantity=>1, :price=>4.095}]
  end

end
