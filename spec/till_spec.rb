require 'till.rb'
require 'order.rb'
require 'shop.rb'


describe Till do

  let(:shop) {Shop.new}
  let(:till) {Till.new(shop)}
  let(:order1) {Order.new(1)}
  let(:order2) {Order.new(2)}

    it 'should be able to register an order' do
      order1.add_item('Cafe Latte', 2)
      till.register_order(order1)
      expect(till.orders[0].table_number).to eq 1
    end

    it 'should be able to add prices to the order hash' do
      order1.add_item('Cafe Latte',2)
      order1.add_item('Flat White', 1)
      shop.load_information('./hipstercoffee.json')
      till.register_order(order1)
      till.add_prices(1)
      expect(till.orders[0].table_order).to eq [{:item=>"Cafe Latte", :quantity=>2, :price=>9.5}, {:item=>"Flat White", :quantity=>1, :price=>4.75}]
    end

    it 'should be able to calculate a subtotal give the order' do
      order1.add_item('Cafe Latte',2)
      order1.add_item('Flat White', 1)
      shop.load_information('./hipstercoffee.json')
      till.register_order(order1)
      expect(till.calc_subtotal(1)).to eq 14.25
    end

    it 'should be able to calculate tax value' do
      order1.add_item('Cafe Latte',2)
      order1.add_item('Flat White', 1)
      shop.load_information('./hipstercoffee.json')
      till.register_order(order1)
      expect(till.calc_tax(1)).to eq 1.23
    end

    it 'should be able to calculate total' do
      order1.add_item('Cafe Latte',2)
      order1.add_item('Flat White', 1)
      shop.load_information('./hipstercoffee.json')
      till.register_order(order1)
      expect(till.calc_total(1)).to eq 15.48
    end

    it 'should be able to give all order info in a hash for multiple tables' do
      order1.add_item('Cafe Latte',2)
      order1.add_item('Flat White', 1)
      order2.add_item('Cafe Latte',2)
      shop.load_information('./hipstercoffee.json')
      till.register_order(order1)
      till.register_order(order2)
      expect(till.order_information(1)).to eq ({ subtotal: 14.25, tax: 1.23, total: 15.48 })
      expect(till.order_information(2)).to eq ({ subtotal: 9.5, tax: 0.82, total: 10.32 })
    end

end
