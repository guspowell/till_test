require 'till.rb'

describe Till do

  it 'should be able to add an item and a quantity' do
    till = Till.new
    till.add_item('cafe latte',2)
    expect(till.order).to eq([{  item: 'cafe latte', quantity: 2 }])
  end

end
