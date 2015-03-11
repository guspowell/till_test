require 'till.rb'
require 'order.rb'

describe Till do

  let(:till) {Till.new}
  let(:order) {Order.new(2)}

    it 'should be able to load a json' do
      expect( till.load_information('./hipstercoffee.json').class).to eq Hash
    end

    it 'should be able to register an order' do
      order.add_item('Cafe Latte', 2)
      till.register_order(order)
      expect(till.orders[0].table_number).to eq 2
    end

    # it 'should be able to calculate prices of the items' do
    #   order.add_item('Cafe Latte', 2)
    #   expect(till.calc_prices(order)).to eq [{ item: item, quantity: quantity, price: 4.75 }]
    # end

    it 'should be able to add prices to the order hash' do
      order.add_item('Cafe Latte',2)
      order.add_item('Flat White', 1)
      till.load_information('./hipstercoffee.json')
      till.register_order(order)
      till.add_prices(2)
      expect(till.orders[0].all_items).to eq [{:item=>"Cafe Latte", :quantity=>2, :price=>9.5}, {:item=>"Flat White", :quantity=>1, :price=>4.75}]
    end

    it 'should be able to calculate a subtotal give the order' do
      order.add_item('Cafe Latte',2)
      order.add_item('Flat White', 1)
      till.load_information('./hipstercoffee.json')
      till.register_order(order)
      expect(till.calc_subtotal(2)).to eq 14.25
    end

    it 'should be able to calculate tax value' do
      order.add_item('Cafe Latte',2)
      order.add_item('Flat White', 1)
      till.load_information('./hipstercoffee.json')
      till.register_order(order)
      expect(till.calc_tax(2)).to eq 1.23
    end

    it 'should be able to calculate total' do
      order.add_item('Cafe Latte',2)
      order.add_item('Flat White', 1)
      till.load_information('./hipstercoffee.json')
      till.register_order(order)
      expect(till.calc_total(2)).to eq 15.48
    end

    it 'should be able to give all order info in a hash' do
      order.add_item('Cafe Latte',2)
      order.add_item('Flat White', 1)
      till.load_information('./hipstercoffee.json')
      till.register_order(order)
      expect(till.order_information(2)).to eq ({ subtotal: 14.25, tax: 1.23, total: 15.48 })
    end


end
