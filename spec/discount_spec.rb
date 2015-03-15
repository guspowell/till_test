require 'discount.rb'

# class Till; include Discount; end

describe Discount do

  let(:shop) {Shop.new}
  let(:till) {Till.new(shop)}
  let(:order1) {Order.new(1)}

  it 'should be able to toggle the muffin discount' do
    expect(till.muffin_discount).to be true
    till.toggle_muffin_discount
    expect(till.muffin_discount).to be false
  end

  it 'should have a 10% discount for overs over $50' do
    order1.add_item('Cafe Latte',20)
    shop.load_information('./hipstercoffee.json')
    till.register_order(order1)
    expect(till.fifty_pound_discount(1, 0.1)).to eq 9.5
  end

end
