require 'discount.rb'

class Till; include Discount; end

describe Discount do

  it 'should have a 10% discount for overs over $50' do
    order1.add_item('Cafe Latte',20)
    shop.load_information('./hipstercoffee.json')
    till.register_order(order1)
    expect(till.calc_discount(1, 0.1)).to eq 9.5
  end

  it 'should reduce the muffin price by 10% if muffin discount is on' do
    order1.add_item('Cafe Latte',20)
    shop.load_information('./hipstercoffee.json')
    till.turn_on_muffin_discount
  end

end
